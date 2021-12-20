part of 'weather_cubit.dart';

enum WeatherStatus { initial, loading, success, failure }

extension WeatherStateX on WeatherStatus {
  bool get isInitial => this == WeatherStatus.initial;
  bool get isLoading => this == WeatherStatus.loading;
  bool get isSuccess => this == WeatherStatus.success;
  bool get isFailure => this == WeatherStatus.failure;
}

@JsonSerializable()
class WeatherState extends Equatable {
  final WeatherStatus status;
  final TemperatureUnits temperatureUnits;
  final Weather weather;

  factory WeatherState.fromJson(Map<String, dynamic> json) =>
      _$WeatherStateFromJson(json);

  WeatherState(
      {this.status = WeatherStatus.initial,
      this.temperatureUnits = TemperatureUnits.celsius,
      Weather? weather})
      : weather = weather ?? Weather.empty;

  WeatherState copyWith(
      {WeatherStatus? status,
      TemperatureUnits? temperatureUnits,
      Weather? weather}) {
    return WeatherState(
        weather: weather ?? this.weather,
        temperatureUnits: temperatureUnits ?? this.temperatureUnits,
        status: status ?? this.status);
  }

  Map<String, dynamic> toJson() => _$WeatherStateToJson(this);

  @override
  List<Object?> get props => [status, temperatureUnits, weather];
}
