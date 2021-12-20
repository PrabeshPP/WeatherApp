import 'package:flutter/material.dart';
import 'package:weather/weather/models/models.dart';

class WeatherPopulated extends StatelessWidget {
  const WeatherPopulated({Key? key,required  this.weather,required  this.units,required  this.onRefresh}) : super(key: key);
  final Weather weather;
  final TemperatureUnits units;
  final ValueGetter<Future<void>> onRefresh;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        
      ],
    );
  }
}
