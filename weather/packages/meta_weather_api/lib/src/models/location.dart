/* location model that would provide latitude and longitude 
,each time a place name is entered */

import 'package:json_annotation/json_annotation.dart';
part 'location.g.dart';

enum LocationType {
  @JsonValue('City')
  city,
  @JsonValue('Region')
  region,
  @JsonValue("State")
  state,
  @JsonValue('Country')
  country,
  @JsonValue('Continent')
  continent
}

@JsonSerializable()
class Location {
  final String title;
  final LocationType locationType;
  @JsonKey(name: 'latt_long')
  @LatLngConverter()
  final Latlng lattlong;
  final int woeid;

  Location(
      {required this.title,
      required this.locationType,
      required this.woeid,
      required this.lattlong});

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}

class Latlng {
  final double latitude;
  final double longitude;

  Latlng({required this.latitude, required this.longitude});
}

class LatLngConverter implements JsonConverter<Latlng, String> {
  const LatLngConverter();
  @override
  Latlng fromJson(String json) {
    final parts = json.split(",");
    return Latlng(
        latitude: double.tryParse(parts[0]) ?? 0,
        longitude: double.tryParse(parts[1]) ?? 1);
  }

  @override
  String toJson(Latlng object) {
    return '${object.latitude},${object.longitude}';
  }
}
