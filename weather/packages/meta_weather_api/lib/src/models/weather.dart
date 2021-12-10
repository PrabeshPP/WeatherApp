//weather model will store the data return by the weather API


enum WeahterStates {
  snow,
  sleet,
  hail,
  thunderstorm,
  heavyRain,
  lightRain,
  showers,
  heavyCloud,
  lightCloud,
  clear,
  unknown
}
enum WindDirectionCompass {
  north,
  northEast,
  east,
  southEast,
  south,
  southWest,
  west,
  northWest,
  unknown
}

class Weather {
  final int id;
  final String weatherStateName;
  final WeahterStates weatherStateAbbr;
  final WindDirectionCompass windDirectionCompass;
  final String created;
  final String applicableDate;
  final double minTemp;
  final double maxTemp;
  final double theTemp;
  final double windSpeed;
  final double windDirection;
  final double airPressure;
  final int humidity;
  final double visibility;
  final int predictability;

  const Weather(
      {required this.id,
      required this.weatherStateName,
      required this.weatherStateAbbr,
      required this.windDirectionCompass,
      required this.created,
      required this.applicableDate,
      required this.minTemp,
      required this.maxTemp,
      required this.theTemp,
      required this.windSpeed,
      required this.windDirection,
      required this.airPressure,
      required this.humidity,
      required this.visibility,
      required this.predictability});
}
