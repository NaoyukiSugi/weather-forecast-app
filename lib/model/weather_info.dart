import 'package:flutter_training/model/weather_condition.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/weather_info.freezed.dart';

part 'generated/weather_info.g.dart';

typedef JsonMap = Map<String, dynamic>;

@freezed
class WeatherInfo with _$WeatherInfo {
  const factory WeatherInfo({
    required WeatherCondition weatherCondition,
    required int maxTemperature,
    required int minTemperature,
  }) = _WeatherInfo;

  factory WeatherInfo.fromJson(JsonMap json) => _$WeatherInfoFromJson(json);
}
