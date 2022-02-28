import 'package:get_it/get_it.dart';
import 'package:weather_app/src/services/repos/weather_repo.dart';

final sl = GetIt.instance;

void slSetUp() {
  sl.registerLazySingleton<WeatherRepo>(() => WeatherRepo());
}
