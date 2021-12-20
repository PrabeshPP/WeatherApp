import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:weather/weather/models/weather.dart';
import 'package:weather_repository/weather_repository.dart' as weather1;

class ThemeCubit extends HydratedCubit<Color> {
  ThemeCubit() : super(defaultColor);
  static const defaultColor = Color(0xFF2196F3);

  void updateTheme(Weather? weather) {
    if (weather != null) emit(weather.toColor);
  }

  @override
  Color? fromJson(Map<String, dynamic> json) {
    return Color(int.parse(json['color'] as String));
  }

  @override
  Map<String, dynamic>? toJson(Color state) {
    return <String, String>{'color': '${state.value}'};
  }
}

extension on Weather {
  Color get toColor {
    switch (condition) {
      case weather1.WeatherCondition.clear:
        return Colors.orangeAccent;
      case weather1.WeatherCondition.snowy:
        return Colors.lightBlueAccent;
      case weather1.WeatherCondition.cloudy:
        return Colors.blueGrey;
      case weather1.WeatherCondition.rainy:
        return Colors.indigoAccent;
      case weather1.WeatherCondition.unknown:
      default:
        return ThemeCubit.defaultColor;
    }
  }
}
