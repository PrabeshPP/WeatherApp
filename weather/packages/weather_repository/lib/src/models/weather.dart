import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

enum WeatherCondition { clear, rainy, cloudy, snowy, unknown }
@JsonSerializable()
class Weather extends Equatable {
  final String location;
  final WeatherCondition weatherCondition;
  final double temperature;

 const  Weather({required this.location,required  this.weatherCondition,required  this.temperature});
  @override
  List<Object> get props =>[location,temperature,weatherCondition];
}
