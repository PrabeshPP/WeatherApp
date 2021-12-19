import 'package:meta_weather_api/meta_weather_api.dart' hide Weather;

class WeatherFailure implements Exception {}

class WeatherRepository {
  final MetaWeatherApiClientt _metaWeatherApiClientt;

  WeatherRepository(MetaWeatherApiClientt? metaWeatherApiClientt):_metaWeatherApiClientt=metaWeatherApiClientt ?? MetaWeatherApiClientt();

  Future<Weather> getWeather
}
