import 'package:flutter_training/gen/assets.gen.dart';

enum WeatherType {
  sunny,
  cloudy,
  rainy,
  undefined,
}

extension WeatherTypeExt on WeatherType {
  String get assetPath {
    return switch (this) {
      WeatherType.sunny => Assets.images.sunny,
      WeatherType.cloudy => Assets.images.cloudy,
      WeatherType.rainy => Assets.images.rainy,
      WeatherType.undefined => '',
    };
  }
}
