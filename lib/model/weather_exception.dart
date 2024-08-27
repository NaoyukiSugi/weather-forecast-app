sealed class WeatherException implements Exception {}

class UnknownException extends WeatherException {}

class InvalidParameterException extends WeatherException {}
