import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/fetch_weather_request.freezed.dart';

part 'generated/fetch_weather_request.g.dart';

@freezed
class FetchWeatherRequest with _$FetchWeatherRequest {
  const factory FetchWeatherRequest({
    required String area,
    required DateTime date,
  }) = _FetchWeatherRequest;

  factory FetchWeatherRequest.fromJson(Map<String, dynamic> json) =>
      _$FetchWeatherRequestFromJson(json);
}
