import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/model/weather_condition.dart';
import 'package:flutter_training/model/weather_exception.dart';
import 'package:flutter_training/model/weather_info.dart';
import 'package:flutter_training/repository/weather_notifier.dart';
import 'package:flutter_training/repository/weather_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../create_container.dart';
import 'weather_notifier_test.mocks.dart';

@GenerateNiceMocks([MockSpec<WeatherRepository>()])
void main() {
  final repository = MockWeatherRepository();

  tearDown(() {
    reset(repository);
  });

  group('when fetchWeather is called', () {
    test('state is updated when repository returns response', () {
      final container = createContainer(
        overrides: [weatherRepositoryProvider.overrideWithValue(repository)],
      );

      const weatherInfo = WeatherInfo(
        weatherCondition: WeatherCondition.sunny,
        maxTemperature: 0,
        minTemperature: 0,
      );

      when(repository.fetchWeather()).thenReturn(weatherInfo);

      container.read(weatherNotifierProvider.notifier).fetchWeather();

      expect(
        container.read(weatherNotifierProvider),
        weatherInfo,
      );
    });

    test('''
        state is not updated and throws exception when repository throws
        exception
        ''', () {
      final container = createContainer(
        overrides: [weatherRepositoryProvider.overrideWithValue(repository)],
      );

      when(repository.fetchWeather()).thenThrow(UnknownException());

      expect(container.read(weatherNotifierProvider), null);

      expect(
        () {
          container.read(weatherNotifierProvider.notifier).fetchWeather();
        },
        throwsA(isA<UnknownException>()),
      );
    });
  });
}
