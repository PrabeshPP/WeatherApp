import 'dart:async';
import 'dart:convert';
import 'package:meta_weather_api/meta_weather_api.dart';
import 'package:http/http.dart' as http;

class LocationIdRequestFailure implements Exception {}

class LocationNotFoundFailure implements Exception {}

class WeatherRequestFailure implements Exception {}

class WeatherNotFoundFailure implements Exception {}

class MetaWeatherApiClientt {
  MetaWeatherApiClientt({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  static const _baseUrl = "www.metaweather.com";
  final http.Client _httpClient;

  Future<Location> locationSearch(String query) async {
    final locationRequest = Uri.https(
        _baseUrl, '/api/location/search', <String, String>{'query': query});
    final locationResponse = await _httpClient.get(locationRequest);
    if (locationResponse.statusCode != 200) {
      throw LocationIdRequestFailure();
    }
    final locationJson = jsonDecode(locationResponse.body) as List;
    if (locationJson.isEmpty) {
      throw LocationNotFoundFailure();
    }

    return Location.fromJson(locationJson.first as Map<String, dynamic>);
  }

  Future<Weather> weatherSearch(int locationId) async {
    final weatherRequest = Uri.http(_baseUrl, '/api/location/$locationId');
    final weatherResponse = await _httpClient.get(weatherRequest);
    if (weatherResponse.statusCode != 200) {
      throw WeatherRequestFailure();
    }
    final weatherJson =
        jsonDecode(weatherResponse.body)["consolidated_weather"] as List;
    if (weatherJson.isEmpty) {
      WeatherNotFoundFailure();
    }

    return Weather.fromJson(weatherJson.first as Map<String, dynamic>);
  }
}
