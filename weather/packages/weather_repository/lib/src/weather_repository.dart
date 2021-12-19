import 'package:meta_weather_api/meta_weather_api.dart' hide Weather;
import 'package:weather_repository/weather_repository.dart';

class WeatherFailure implements Exception {}

class WeatherRepository {
  final MetaWeatherApiClientt _metaWeatherApiClientt;

  WeatherRepository({MetaWeatherApiClientt? metaWeatherApiClientt})
      : _metaWeatherApiClientt =
            metaWeatherApiClientt ?? MetaWeatherApiClientt();

  Future<Weather> getWeather(String city) async {
    final location = await _metaWeatherApiClientt.locationSearch(city);
    final woeid = location.woeid;
    final weather = await _metaWeatherApiClientt.weatherSearch(woeid);
    return Weather(
        location: weather.weatherStateName,
        weatherCondition: weather.weatherStateAbbr.toCondition,
        temperature: weather.theTemp);
  }
}

extension on WeatherState {
  WeatherCondition get toCondition {
    switch (this) {
      case WeatherState.clear:
        return WeatherCondition.clear;
      case WeatherState.snow:
      case WeatherState.sleet:
      case WeatherState.hail:
        return WeatherCondition.snowy;
      case WeatherState.thunderstorm:
      case WeatherState.heavyRain:
      case WeatherState.lightRain:
      case WeatherState.showers:
        return WeatherCondition.rainy;
      case WeatherState.heavyCloud:
      case WeatherState.lightCloud:
        return WeatherCondition.cloudy;
      default:
        return WeatherCondition.unknown;
    }
  }
}
