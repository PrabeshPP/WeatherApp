import 'dart:convert';
import 'package:meta_weather_api/meta_weather_api.dart';
import 'package:http/http.dart' as http;

class LocationIdRequestFailure implements Exception {}

class LocationNotFoundFailure implements Exception {}

class WeatherRequestFailure implements Exception {}

class WeatherNotFoundFailure implements Exception {}

const _baseUrl = "www.metaweather.com";
final _httpClient = http.Client();
Future<Location> locationSearch(String query) async {
  final locationRequest = Uri.https(
      _baseUrl, 'api/location/search', <String, String>{'query': query});
  final locationResponse = await _httpClient.get(locationRequest);
  if (locationResponse.statusCode != 200) {
    throw LocationIdRequestFailure();
  }
  final locationJson = jsonDecode(locationResponse.body) as List;
  if (locationJson.isEmpty) {
    throw LocationIdRequestFailure();
  }

  return Location.fromJson(locationJson.first as Map<String, dynamic>);
}
