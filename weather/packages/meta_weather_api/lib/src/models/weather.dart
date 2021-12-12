/* this file would return the weather data of the entered place */

enum WeatherState{
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
enum WindDirectionCompass{
  north,
  northEast,
  east,
  southEast,
  south,
  soouthwest,
  west,
  northWest,
  unknown
}


class Weather {
  final String id;
  final String weatherStateName;
  final WeatherState weatherStateAbbr;
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

  Weather({required this.id,
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
