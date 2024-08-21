import 'package:flutter_training/gen/assets.gen.dart';

enum WeatherCondition {
  sunny,
  cloudy,
  rainy,
}

extension WeatherTypeExt on WeatherCondition {
  String get assetPath {
    return switch (this) {
      WeatherCondition.sunny => Assets.images.sunny,
      WeatherCondition.cloudy => Assets.images.cloudy,
      WeatherCondition.rainy => Assets.images.rainy,
    };
  }
}
