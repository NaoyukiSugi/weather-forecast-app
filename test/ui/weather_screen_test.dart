import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg_test/flutter_svg_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/model/weather_condition.dart';
import 'package:flutter_training/model/weather_info.dart';
import 'package:flutter_training/repository/weather_repository.dart';
import 'package:flutter_training/ui/weather_screen.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'weather_screen_test.mocks.dart';

@GenerateNiceMocks([MockSpec<WeatherRepository>()])
void main() {
  final repository = MockWeatherRepository();

  tearDown(() {
    reset(repository);
  });

  testWidgets('weather test', (tester) async {
    for (final weather in WeatherCondition.values) {
      tester.view.physicalSize = const Size(1080, 2400);

      final weatherInfo = WeatherInfo(
        weatherCondition: weather,
        maxTemperature: 0,
        minTemperature: 0,
      );
      when(repository.fetchWeather()).thenReturn(weatherInfo);

      final asset = SvgPicture.asset(weather.assetPath);

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            weatherRepositoryProvider.overrideWithValue(repository),
          ],
          child: const MaterialApp(
            home: Scaffold(
              body: WeatherScreen(),
            ),
          ),
        ),
      );

      await tester.tap(find.byKey(reloadButtonKey));
      await tester.pump();

      expect(
        find.svg(asset.bytesLoader),
        findsOneWidget,
      );
    }
  });
}
