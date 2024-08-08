import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  WeatherType _weatherType = WeatherType.sunny;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.5,
          child: Column(
            children: [
              const Spacer(),
              _WeatherForecastResult(weatherType: _weatherType),
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
      final weather = _repository.fetchWeather();
      _weatherType = WeatherType.values.firstWhere(
        (element) {
          return element.name == weather;
        },
        orElse: () => WeatherType.undefined,
      );
    });
  }
}

class _WeatherForecastResult extends StatelessWidget {
  const _WeatherForecastResult({required WeatherType weatherType})
      : _weatherType = weatherType;

  final WeatherType _weatherType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _WeatherImage(weatherType: _weatherType),
        const Row(
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
  const _WeatherImage({required WeatherType weatherType})
      : _weatherType = weatherType;

  final WeatherType _weatherType;

  @override
  Widget build(BuildContext context) {
    return switch (_weatherType) {
      WeatherType.sunny ||
      WeatherType.cloudy ||
      WeatherType.rainy =>
        AspectRatio(
          aspectRatio: 1 / 1,
          child: SvgPicture.asset(_weatherType.assetPath),
        ),
      WeatherType.undefined => const Placeholder(),
    };
  }
}

class _TemperatureText extends StatelessWidget {
  const _TemperatureText({required Color color}) : _color = color;

  final Color _color;

  @override
  Widget build(BuildContext context) {
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
