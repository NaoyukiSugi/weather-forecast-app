import 'dart:convert';
import 'package:flutter_training/model/fetch_weather_request.dart';
import 'package:flutter_training/model/weather_exception.dart';
import 'package:flutter_training/model/weather_info.dart';
import 'package:flutter_training/repository/yumemi_weather.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

part 'generated/weather_repository.g.dart';

@riverpod
WeatherRepository weatherRepository(WeatherRepositoryRef ref) =>
    WeatherRepository(ref.watch(yumemiWeatherProvider));

class WeatherRepository {
  WeatherRepository(this._yumemiWeather);

  final YumemiWeather _yumemiWeather;

  WeatherInfo fetchWeather() {
    final request = FetchWeatherRequest(area: 'tokyo', date: DateTime.now());

    try {
      final response = _yumemiWeather.fetchWeather(jsonEncode(request));
      return WeatherInfo.fromJson(jsonDecode(response) as Map<String, dynamic>);
    } on YumemiWeatherError catch (e) {
      switch (e) {
        case YumemiWeatherError.unknown:
          throw UnknownException();
        case YumemiWeatherError.invalidParameter:
          throw InvalidParameterException();
      }
    }
  }
}
