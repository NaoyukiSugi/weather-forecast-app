import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_training/weather_info.dart';
import 'package:flutter_training/weather_repository.dart';
import 'package:flutter_training/weather_type.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<StatefulWidget> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final WeatherRepository _repository = WeatherRepository(YumemiWeather());
  WeatherInfo? _weatherInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.5,
          child: Column(
            children: [
              const Spacer(),
              _WeatherForecastResult(weatherInfo: _weatherInfo),
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
                          text: 'Reload',
                          onPressed: _fetchWeather,
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
    );
  }

  void _fetchWeather() {
    setState(() {
      try {
        _weatherInfo = _repository.fetchWeather();
      } on YumemiWeatherError catch (_) {
        unawaited(_showErrorDialog(context));
      }
    });
  }
}

Future<void> _showErrorDialog(BuildContext context) async {
  await showDialog<void>(
    context: context,
    builder: (context) {
      return AlertDialog(
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

class _WeatherForecastResult extends StatelessWidget {
  const _WeatherForecastResult({required WeatherInfo? weatherInfo})
      : _weatherInfo = weatherInfo;

  final WeatherInfo? _weatherInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _WeatherImage(weatherCondition: _weatherInfo?.weatherCondition),
        Row(
          children: [
            Expanded(
              child: _TemperatureText(
                color: Colors.blue,
                temperature: _weatherInfo?.minTemperature,
              ),
            ),
            Expanded(
              child: _TemperatureText(
                color: Colors.red,
                temperature: _weatherInfo?.maxTemperature,
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
  const _TemperatureText({required Color color, required int? temperature})
      : _color = color,
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
  const _EventButton({required String text, required void Function() onPressed})
      : _onPressed = onPressed,
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
