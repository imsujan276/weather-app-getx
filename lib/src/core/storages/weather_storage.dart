import 'package:get_storage/get_storage.dart';

final weatherStorage = GetStorage('weather_storage');

class WeatherStorage {
  static Future<void> cacheLocation(String value) async =>
      await weatherStorage.write('location', value);

  static String get location => weatherStorage.read('location') ?? '';

  /// clears cached data in local storage
  static void clearData() => weatherStorage.erase();
}
