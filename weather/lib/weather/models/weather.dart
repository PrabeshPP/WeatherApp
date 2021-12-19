import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_repository/weather_repository.dart' hide Weather;
import 'package:weather_repository/weather_repository.dart';

enum TemperatureUnits { fahrenheit, celsius }

extension TemperatureUnitX on TemperatureUnits {
  bool get isFahrenheit => this == TemperatureUnits.fahrenheit;
  bool get isCelsius => this == TemperatureUnits.celsius;
}

@JsonSerializable()
class Temperature extends Equatable {
  final double value;

  const Temperature({required this.value});

  factory Temperature.fromJson(Map<String, dynamic> json) =>
      _$TemperatureFromJson(json);

  Map<String, dynamic> toJson() => _$TemperatureToJson(this);

  @override
  List<Object?> get props => [value];
}

@JsonSerializable()
class Weather extends Equatable {
  const Weather(
      {required this.condition,
      required this.lastUpdated,
      required this.location,
      required this.temperature});
  final WeatherCondition condition;
  final DateTime lastUpdated;
  final String location;
  final Temperature temperature;

  factory Weather.fromJson(Map<String, dynamic> jsoon) =>
      _$WeatherFromJson(json);
  

  Map<String, dynamic> toJson() => _$WeatherToJson(this);

  @override
  List<Object?> get props => [condition, temperature, lastUpdated, location];
}
