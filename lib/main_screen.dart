import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_training/gen/assets.gen.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.5,
          child: Column(
            children: [
              Spacer(),
              _WeatherForecastResult(),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 80),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: _EventButton(
                          text: 'Close',
                        ),
                      ),
                      Expanded(
                        child: _EventButton(
                          text: 'Reload',
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
}

class _WeatherForecastResult extends ConsumerWidget {
  const _WeatherForecastResult();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Column(
      children: [
        _WeatherImage(),
        Row(
          children: [
            Expanded(
              child: _TemperatureText(color: Colors.blue),
            ),
            Expanded(
              child: _TemperatureText(color: Colors.red),
            ),
          ],
        ),
      ],
    );
  }
}

class _WeatherImage extends ConsumerWidget {
  const _WeatherImage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: SvgPicture.asset(Assets.images.sunny),
    );
  }
}

class _TemperatureText extends ConsumerWidget {
  const _TemperatureText({required Color color}) : _color = color;

  final Color _color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(
        '** ℃',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(color: _color),
      ),
    );
  }
}

class _EventButton extends ConsumerWidget {
  const _EventButton({required String text}) : _text = text;

  final String _text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onPressed: () {},
      child: Text(
        _text,
        style: const TextStyle(
          color: Colors.blue,
        ),
      ),
    );
  }
}
