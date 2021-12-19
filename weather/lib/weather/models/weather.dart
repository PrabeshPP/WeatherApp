import 'package:equatable/equatable.dart';
import 'package:weather_repository/weather_repository.dart' hide Weather;
import 'package:weather_repository/weather_repository.dart';

enum TemperatureUnits{fahrenheit ,celsius}

extension TemperatureUnitX on TemperatureUnits{

}

class Temperature extends Equatable {
  final double value;

 const  Temperature({required this.value});

  @override
  List<Object?> get props => throw UnimplementedError();
}
