import 'package:flutter_training/model/weather_info.dart';
import 'package:flutter_training/repository/weather_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/weather_notifier.g.dart';

@riverpod
class WeatherNotifier extends _$WeatherNotifier {
  late final WeatherRepository _repository;

  @override
  Future<WeatherInfo?> build() async {
    _repository = ref.read(weatherRepositoryProvider);
    return null;
  }

  Future<void> fetchWeather() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(_repository.fetchWeather);
  }
}
