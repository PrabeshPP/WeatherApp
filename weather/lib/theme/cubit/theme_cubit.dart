import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:weather/weather/models/weather.dart';
import 'package:weather_repository/weather_repository.dart' as Weather1;

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
      case Weather1.WeatherCondition.clear:
        return Colors.orangeAccent;
      case Weather1.WeatherCondition.snowy:
        return Colors.lightBlueAccent;
      case Weather1.WeatherCondition.cloudy:
        return Colors.blueGrey;
      case Weather1.WeatherCondition.rainy:
        return Colors.indigoAccent;
      case Weather1.WeatherCondition.unknown:
      default:
        return ThemeCubit.defaultColor;
    }
  }
}
