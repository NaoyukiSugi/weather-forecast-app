import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_training/main.dart';
import 'package:flutter_training/weather_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with RouteAware {
  @override
  void initState() {
    super.initState();

    unawaited(
      WidgetsBinding.instance.endOfFrame.then((_) {
        if (mounted) {
          _navigateToWeatherScreenAfterDelay();
        }
      }),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final modalRoute = ModalRoute.of(context);
    if (modalRoute != null && modalRoute is PageRoute) {
      routeObserver.subscribe(this, modalRoute);
    }
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() {
    unawaited(_navigateToWeatherScreenAfterDelay());
  }

  Future<void> _navigateToWeatherScreenAfterDelay() async {
    await Future.delayed(const Duration(milliseconds: 500), () {
      Navigator.push(
        context,
        MaterialPageRoute<void>(builder: (context) => const WeatherScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
    );
  }
}
