import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                          text: "Close",
                        ),
                      ),
                      Expanded(
                        child: _EventButton(
                          text: "Reload",
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


class _WeatherForecastResult extends StatelessWidget {
  const _WeatherForecastResult();

  @override
  Widget build(BuildContext context) {
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

class _WeatherImage extends StatelessWidget {
  const _WeatherImage();

  @override
  Widget build(BuildContext context) {
    return const AspectRatio(
      aspectRatio: 1 / 1,
      child: Placeholder(),
    );
  }
}

class _TemperatureText extends StatelessWidget {
  const _TemperatureText({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(
        "** ℃",
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(color: color),
      ),
    );
  }
}

class _EventButton extends StatelessWidget {
  const _EventButton({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.blue,
        ),
      ),
    );
  }
}
