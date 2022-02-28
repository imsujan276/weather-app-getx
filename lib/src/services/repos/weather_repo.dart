import 'package:weather_app/src/mixins/exceptions_controller_mixin.dart';
import 'package:weather_app/src/services/clients/base_http_client.dart';

class WeatherRepo extends BaseHttpClient with ExceptionsControllerMixin {
  /// fetch weather response with geo-coordinates
  Future<dynamic> fetchWeatherInfo(String query) async {
    final response =
        await requests(method: METHOD.get, queryParameters: {"q": query});
    return returnresponse(response);
  }
}
