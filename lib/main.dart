import 'package:flutter/material.dart';
import 'package:flutter_training/splash_screen.dart';

final RouteObserver<dynamic> routeObserver =
    RouteObserver<PageRoute<dynamic>>();

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplashScreen(),
      navigatorObservers: [
        routeObserver,
      ],
    );
  }
}
