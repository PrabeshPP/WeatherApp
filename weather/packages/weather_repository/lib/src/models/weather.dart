import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'weather.g.dart';

enum WeatherCondition { clear, rainy, cloudy, snowy, unknown }

@JsonSerializable()
class Weather extends Equatable {
  final String location;
  final WeatherCondition weatherCondition;
  final double temperature;

  const Weather(
      {required this.location,
      required this.weatherCondition,
      required this.temperature});
  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherToJson(this);
  @override
  List<Object> get props => [location, temperature, weatherCondition];
}
