import 'dart:convert';

import 'package:flutter_training/fetch_weather_request.dart';
import 'package:flutter_training/weather_info.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

class WeatherRepository {
  WeatherRepository(this._yumemiWeather);

  final YumemiWeather _yumemiWeather;

  WeatherInfo fetchWeather() {
    final request = FetchWeatherRequest(area: 'tokyo', date: DateTime.now());
    final response = _yumemiWeather.fetchWeather(jsonEncode(request));
    return WeatherInfo.fromJson(jsonDecode(response) as Map<String, dynamic>);
  }
}
