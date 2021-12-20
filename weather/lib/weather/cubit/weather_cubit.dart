import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather/weather/models/models.dart';
import 'package:weather_repository/weather_repository.dart'
    show WeatherRepository;

part 'weather_cubit.g.dart';
part 'weather_state.dart';

class WeatherCubit extends HydratedCubit<WeatherState> {
  final WeatherRepository _weatherRepository;
  WeatherCubit(this._weatherRepository) : super(WeatherState());

  Future<void> fetchWeather(String? city) async {
    if (city == null || city.isEmpty) return;
    emit(state.copyWith(status: WeatherStatus.loading));

    try {
      final weather =
          Weather.fromRepository(await _weatherRepository.getWeather(city));
      final units = state.temperatureUnits;
      final value = units.isFahrenheit
          ? weather.temperature.value.toFahrenheit()
          : weather.temperature.value;
      emit(state.copyWith(
          status: WeatherStatus.success,
          temperatureUnits: units,
          weather: weather.copyWith(temperature: Temperature(value: value))));
    } on Exception {
      emit(state.copyWith(status: WeatherStatus.failure));
    }
  }

  Future<void> refreshWeather() async {
    if (!state.status.isSuccess) return;
    if (state.weather == Weather.empty) return;
    try {
      final weather = Weather.fromRepository(
          await _weatherRepository.getWeather(state.weather.location));
      final units = state.temperatureUnits;
      final value = units.isFahrenheit
          ? weather.temperature.value.toFahrenheit()
          : weather.temperature.value;

      emit(state.copyWith(
          status: WeatherStatus.success,
          temperatureUnits: units,
          weather: weather.copyWith(temperature: Temperature(value: value))));
    } on Exception {
      emit(state);
    }
  }

  

  @override
  WeatherState? fromJson(Map<String, dynamic> json) {
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toJson(WeatherState state) {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
