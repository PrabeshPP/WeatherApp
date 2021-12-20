import 'package:flutter/material.dart';
import 'package:weather/weather/models/models.dart';
import 'package:weather_repository/weather_repository.dart' as weatherCondition;

class WeatherPopulated extends StatelessWidget {
  const WeatherPopulated(
      {Key? key,
      required this.weather,
      required this.units,
      required this.onRefresh})
      : super(key: key);
  final Weather weather;
  final TemperatureUnits units;
  final ValueGetter<Future<void>> onRefresh;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        _WeatherBackground(),
        RefreshIndicator(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              clipBehavior: Clip.none,
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 48,
                    ),
                   _WeatherIcon(condition: weather.condition),
                    Text(
                      weather.location,
                      style: theme.textTheme.headline2
                          ?.copyWith(fontWeight: FontWeight.w200),
                    ),
                    Text(
                      weather.formattedTemperature(units),
                      style: theme.textTheme.headline3
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                        '''Last Updated at ${TimeOfDay.fromDateTime(weather.lastUpdated).format(context)}''')
                  ],
                ),
              ),
            ),
            onRefresh: onRefresh)
      ],
    );
  }
}

class _WeatherIcon extends StatelessWidget {
  const _WeatherIcon({Key? key, required this.condition}) : super(key: key);
  static const _iconSize = 100.0;
  final weatherCondition.WeatherCondition condition;

  @override
  Widget build(BuildContext context) {
    return Text(
      condition.toEmoji,
      style: const TextStyle(fontSize: _iconSize),
    );
  }
}

extension on weatherCondition.WeatherCondition{
  String get toEmoji {
    switch (this) {
      case weatherCondition.WeatherCondition.clear:
        return '☀️';
      case weatherCondition.WeatherCondition.rainy:
        return '🌧️';
      case weatherCondition.WeatherCondition.cloudy:
        return '☁️';
      case weatherCondition.WeatherCondition.snowy:
        return '🌨️';
      case weatherCondition.WeatherCondition.unknown:

      default:
        return '❓';
    }
  }
}

class _WeatherBackground extends StatelessWidget {
  const _WeatherBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              stops: const [0.25, 0.75, 0.90, 1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                color,
                color.brighten(10),
                color.brighten(29),
                color.brighten(60)
              ])),
    );
  }
}

extension on Color {
  Color brighten([int percent = 10]) {
    assert(1 <= percent && percent <= 100);
    final p = percent / 100;
    return Color.fromARGB(alpha, red + ((255 - red) * p).round(),
        green + ((255 - green) * p).round(), blue + ((255 - blue) * p).round());
  }
}

extension on Weather{
  String formattedTemperature(TemperatureUnits units){
    return '''${temperature.value.toStringAsPrecision(2)}°${units.isCelsius ? 'C' : 'F'}''';
  }

}
