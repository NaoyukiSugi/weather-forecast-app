import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_training/weather_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    unawaited(
      WidgetsBinding.instance.endOfFrame.then((_) {
        if (mounted) {
          Future.delayed(
            const Duration(milliseconds: 500),
            _navigateToWeatherScreen,
          );
        }
      }),
    );
  }

  Future<void> _navigateToWeatherScreen() async {
    await Navigator.push(
      context,
      MaterialPageRoute<void>(builder: (context) => const WeatherScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
    );
  }
}
