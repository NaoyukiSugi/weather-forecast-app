import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/weather_type.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

class WeatherNotifier extends StateNotifier<WeatherType> {
  WeatherNotifier() : super(WeatherType.sunny);

  final YumemiWeather yumemiWeather = YumemiWeather();

  void fetchWeather() {
    final weather = yumemiWeather.fetchSimpleWeather();
    state = WeatherType.values.byName(weather);
  }
}

final weatherProvider = StateNotifierProvider<WeatherNotifier, WeatherType>(
  (ref) => WeatherNotifier(),
);
