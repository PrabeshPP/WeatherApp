/* location model that would provide latitude and longitude 
,each time a place name is entered */


enum LocationType { city, region, state, country, continent, unknown }

class Location {
  final String title;
  final LocationType locationType;
  final int woeid;
  final Latlng lattlong;

  Location(
      {required this.title,
      required this.locationType,
      required this.woeid,
      required this.lattlong});
}

class Latlng {
  final double latitude;
  final double longitude;

  Latlng({required this.latitude,
  required this.longitude});
}
