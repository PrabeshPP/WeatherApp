import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_services_binding/flutter_services_binding.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:weather/theme/theme.dart';
import 'package:weather/weather/view/weather_page.dart';
import 'package:weather_repository/weather_repository.dart';

void main() async {
  FlutterServicesBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorage.webStorageDirectory
          : await getTemporaryDirectory());
  HydratedBlocOverrides.runZoned(
      () => runApp(MyApp(weatherRepository: WeatherRepository())),
      storage: storage);
}

class MyApp extends StatelessWidget {
  final WeatherRepository _weatherRepository;
  const MyApp({Key? key, required WeatherRepository weatherRepository}) :_weatherRepository= weatherRepository,super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _weatherRepository,
      child: BlocProvider(
        create: (_) => ThemeCubit(),
        child: const WeatherAppView(),
      ),
    );
  }
}

class WeatherAppView extends StatelessWidget {
  const WeatherAppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, Color>(
      builder: (context, state) {
        return const MaterialApp(home: WeatherPage());
      },
    );
  }
}
