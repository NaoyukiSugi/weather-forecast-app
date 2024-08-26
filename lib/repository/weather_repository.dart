import 'dart:convert';
import 'package:flutter_training/model/fetch_weather_request.dart';
import 'package:flutter_training/model/weather_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

part 'generated/weather_repository.g.dart';

@riverpod
WeatherRepository weatherRepository(WeatherRepositoryRef ref) {
  return WeatherRepository(YumemiWeather());
}

class WeatherRepository {
  WeatherRepository(this._yumemiWeather);

  final YumemiWeather _yumemiWeather;

  WeatherInfo fetchWeather() {
    final request = FetchWeatherRequest(area: 'tokyo', date: DateTime.now());
    final response = _yumemiWeather.fetchWeather(jsonEncode(request));
    return WeatherInfo.fromJson(jsonDecode(response) as Map<String, dynamic>);
  }
}
