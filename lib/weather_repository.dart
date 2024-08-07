import 'package:yumemi_weather/yumemi_weather.dart';

class WeatherRepository {
  WeatherRepository(this._yumemiWeather);

  final YumemiWeather _yumemiWeather;

  String fetchWeather() {
    return _yumemiWeather.fetchSimpleWeather();
  }
}
