import 'dart:convert';
import 'package:flutter_training/weather_type.dart';

typedef JsonMap = Map<String, dynamic>;

class WeatherInfo {
  WeatherInfo({
    required this.weatherType,
    required this.maxTemperature,
    required this.minTemperature,
  });

  factory WeatherInfo.fromJson(String jsonString) {
    final json = jsonDecode(jsonString) as JsonMap;

    final weatherCondition = json['weather_condition'] as String;
    final weatherType = WeatherType.values.firstWhere(
      (element) {
        return element.name == weatherCondition;
      },
      orElse: () => WeatherType.undefined,
    );

    return WeatherInfo(
      weatherType: weatherType,
      maxTemperature: json['max_temperature'] as int,
      minTemperature: json['min_temperature'] as int,
    );
  }

  final WeatherType weatherType;
  final int maxTemperature;
  final int minTemperature;
}
