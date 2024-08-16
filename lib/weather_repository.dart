import 'package:flutter_training/weather_info.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

class WeatherRepository {
  WeatherRepository(this._yumemiWeather);

  final YumemiWeather _yumemiWeather;

  WeatherInfo fetchWeather() {
    const jsonString = '''
    {
      "area": "tokyo",
      "date": "2020-04-01T12:00:00+09:00"
    }''';
    final response = _yumemiWeather.fetchWeather(jsonString);
    return WeatherInfo.fromJson(response);
  }
}
