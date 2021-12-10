//location model would store the data return by location API


enum LocationType { city, region, state, province, country, continent }

class Location {
  final String title;
  final LocationType locationtype;
  final int woeid;
  final LattLong lattlong;

  const Location(
      {required this.title,
      required this.locationtype,
      required this.woeid,
      required this.lattlong});
}

class LattLong {
  final double latitude;
  final double longitude;

  const LattLong({required this.latitude, required this.longitude});
}
