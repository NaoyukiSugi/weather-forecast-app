import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_training/model/weather_condition.dart';
import 'package:flutter_training/repository/weather_notifier.dart';
import 'package:flutter_training/ui/common/loading_indicator.dart';

@visibleForTesting
const reloadButtonKey = Key('reload_button');
@visibleForTesting
const minTemperatureKey = Key('min_temperature');
@visibleForTesting
const maxTemperatureKey = Key('max_temperature');
@visibleForTesting
const errorDialogKey = Key('error_dialog');
@visibleForTesting
const loadingIndicatorKey = Key('loading_indicator');

class WeatherScreen extends ConsumerWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(weatherNotifierProvider, (_, next) async {
      if (next is AsyncError) {
        await _showErrorDialog(context);
      }
    });

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: FractionallySizedBox(
              widthFactor: 0.5,
              child: Column(
                children: [
                  const Spacer(),
                  const _WeatherForecastResult(),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 80),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: _EventButton(
                              text: 'Close',
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                          Expanded(
                            child: _EventButton(
                              key: reloadButtonKey,
                              text: 'Reload',
                              onPressed: () async {
                                await ref
                                    .read(weatherNotifierProvider.notifier)
                                    .fetchWeather();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (ref.watch(weatherNotifierProvider).isLoading)
            const LoadingIndicator(key: loadingIndicatorKey),
        ],
      ),
    );
  }
}

Future<void> _showErrorDialog(BuildContext context) async {
  await showDialog<void>(
    context: context,
    builder: (context) {
      return AlertDialog(
        key: errorDialogKey,
        title: const Text('エラー'),
        content: const Text('エラーが発生しました'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}

class _WeatherForecastResult extends ConsumerWidget {
  const _WeatherForecastResult();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherInfo =
        ref.watch(weatherNotifierProvider.select((value) => value.valueOrNull));

    return Column(
      children: [
        _WeatherImage(weatherCondition: weatherInfo?.weatherCondition),
        Row(
          children: [
            Expanded(
              child: _TemperatureText(
                key: minTemperatureKey,
                color: Colors.blue,
                temperature: weatherInfo?.minTemperature,
              ),
            ),
            Expanded(
              child: _TemperatureText(
                key: maxTemperatureKey,
                color: Colors.red,
                temperature: weatherInfo?.maxTemperature,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _WeatherImage extends StatelessWidget {
  const _WeatherImage({required WeatherCondition? weatherCondition})
      : _weatherCondition = weatherCondition;

  final WeatherCondition? _weatherCondition;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      key: const Key('weather_image'),
      aspectRatio: 1 / 1,
      child: switch (_weatherCondition) {
        null => const Placeholder(),
        WeatherCondition.sunny ||
        WeatherCondition.cloudy ||
        WeatherCondition.rainy =>
          SvgPicture.asset(_weatherCondition.assetPath),
      },
    );
  }
}

class _TemperatureText extends StatelessWidget {
  const _TemperatureText({
    required Color color,
    required int? temperature,
    super.key,
  })  : _color = color,
        _temperature = temperature;
  final Color _color;
  final int? _temperature;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(
        '${_temperature ?? '**'} ℃',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(color: _color),
      ),
    );
  }
}

class _EventButton extends StatelessWidget {
  const _EventButton({
    required String text,
    required void Function() onPressed,
    super.key,
  })  : _onPressed = onPressed,
        _text = text;

  final String _text;
  final VoidCallback _onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _onPressed,
      child: Text(
        _text,
        style: const TextStyle(
          color: Colors.blue,
        ),
      ),
    );
  }
}
