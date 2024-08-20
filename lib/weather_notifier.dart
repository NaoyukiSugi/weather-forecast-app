import 'package:flutter_training/weather_info.dart';
import 'package:flutter_training/weather_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/weather_notifier.g.dart';

@riverpod
class WeatherNotifier extends _$WeatherNotifier {
  late final WeatherRepository _repository;

  @override
  WeatherInfo? build() {
    _repository = ref.read(weatherRepositoryProvider);
    return null;
  }

  void fetchWeather() {
    state = _repository.fetchWeather();
  }
}
