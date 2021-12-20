import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/search/view/search_page.dart';
import 'package:weather/settings/settings.dart';
import 'package:weather/theme/cubit/theme_cubit.dart';
import 'package:weather/weather/cubit/weather_cubit.dart';
import 'package:weather/weather/widgets/widgets.dart';
import 'package:weather_repository/weather_repository.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(context.read<WeatherRepository>()),
      child: const WeatherView(),
    );
  }
}

class WeatherView extends StatelessWidget {
  const WeatherView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push<void>(
                    SettingsPage.route(context.read<WeatherCubit>()));
              },
              icon: const Icon(Icons.settings)),
        ],
      ),
      body: Center(
        child:
            BlocConsumer<WeatherCubit, WeatherState>(builder: (context, state) {
          switch (state.status) {
            case WeatherStatus.initial:
              return const WeatherEmpty();
            case WeatherStatus.loading:
              return const WeatherLoading();
            case WeatherStatus.success:
              return WeatherPopulated(
                  weather: state.weather,
                  units: state.temperatureUnits,
                  onRefresh: () {
                    return context.read<WeatherCubit>().refreshWeather();
                  });
            case WeatherStatus.failure:
            default:
              return const WeatherError();
          }
        }, listener: (context, state) {
          if (state.status.isSuccess) {
            context.read<ThemeCubit>().updateTheme(state.weather);
          }
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final city = await Navigator.of(context).push(SearchPage.route());
          await context.read<WeatherCubit>().fetchWeather(city);
        },
        child: const Icon(Icons.search),
      ),
    );
  }
}
