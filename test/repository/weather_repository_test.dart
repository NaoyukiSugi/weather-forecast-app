import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/model/weather_condition.dart';
import 'package:flutter_training/model/weather_exception.dart';
import 'package:flutter_training/model/weather_info.dart';
import 'package:flutter_training/repository/weather_repository.dart';
import 'package:flutter_training/repository/yumemi_weather.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yumemi_weather/yumemi_weather.dart';
import '../create_container.dart';
import 'weather_repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<YumemiWeather>()])
void main() {
  final yumemiWeather = MockYumemiWeather();

  tearDown(() {
    reset(yumemiWeather);
  });

  group('when fetchWeather is called', () {
    test('returns WeatherInfo when API returns valid response', () {
      const weatherInfoJsonString = '''
      {
        "weather_condition": "sunny",
        "max_temperature": 0,
        "min_temperature": 0,
        "date": "2024-01-01T12:00:00+09:00"
      }
      ''';

      when(yumemiWeather.fetchWeather(any)).thenReturn(weatherInfoJsonString);

      final container = createContainer(
        overrides: [yumemiWeatherProvider.overrideWithValue(yumemiWeather)],
      );

      expect(
        container.read(weatherRepositoryProvider).fetchWeather(),
        equals(
          const WeatherInfo(
            weatherCondition: WeatherCondition.sunny,
            maxTemperature: 0,
            minTemperature: 0,
          ),
        ),
      );
    });

    test('throws UnknownException when API throws unknown error', () {
      when(yumemiWeather.fetchWeather(any))
          .thenThrow(YumemiWeatherError.unknown);

      final container = createContainer(
        overrides: [yumemiWeatherProvider.overrideWithValue(yumemiWeather)],
      );

      expect(
        () => container.read(weatherRepositoryProvider).fetchWeather(),
        throwsA(isA<UnknownException>()),
      );
    });
  });

  test(
      'throws InvalidParameterException when API throws invalidParameter error',
      () {
    when(yumemiWeather.fetchWeather(any))
        .thenThrow(YumemiWeatherError.invalidParameter);

    final container = createContainer(
      overrides: [yumemiWeatherProvider.overrideWithValue(yumemiWeather)],
    );

    expect(
      () => container.read(weatherRepositoryProvider).fetchWeather(),
      throwsA(isA<InvalidParameterException>()),
    );
  });
}
