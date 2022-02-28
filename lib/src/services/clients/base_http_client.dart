import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/src/configs/routes/routes_const.dart';
import 'package:weather_app/src/exceptions/services_exceptions.dart';
import 'package:weather_app/src/services/clients/base_client_config.dart';

enum METHOD { get, post, put, delete }

class BaseHttpClient {
  var client = http.Client();
  final _timeOutDuration = 30;

  /// [returnResponse] takes [http.Response response] as positional argument
  /// and return dynamic objects according to the [http.Response] status
  returnresponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
      case 204:
        return decodeResponse(response);
      case 400:
      case 401:
      case 403:
        throw BadRequestException(response);
      case 404:
        Get.toNamed(RoutesName.pageNotFound);
        break;
      case 500:
        throw ServerException(response);
      default:
        throw UnknownException(response);
    }
  }

  /// [decodeResponse] method takes [http.Response]
  /// response(positional argument) and
  /// returns response into deocded [Map<String,dynamic>]
  /// type json object
  decodeResponse(http.Response response) =>
      jsonDecode(utf8.decode(response.bodyBytes));

  /// base Http client requests methods [GET, POST, PUT, DELETE]
  Future<http.Response> requests({
    required METHOD method,
    Map<String, dynamic>? body,
    Map<String, String>? queryParameters,
  }) async {
    dynamic _response;

    switch (method) {

      /// get method
      case METHOD.get:
        _response = await client
            .get(
              BaseClientConfig.parseHttpsUri(parameter: queryParameters),
              headers: BaseClientConfig.headers(),
            )
            .timeout(Duration(seconds: _timeOutDuration));
        return _response;

      /// post method
      case METHOD.post:
        _response = await client
            .post(
              BaseClientConfig.parseHttpsUri(parameter: queryParameters),
              headers: BaseClientConfig.headers(),
              body: body,
            )
            .timeout(Duration(seconds: _timeOutDuration));
        return _response;

      /// put method
      case METHOD.put:
        _response = await client
            .put(
              BaseClientConfig.parseHttpsUri(parameter: queryParameters),
              headers: BaseClientConfig.headers(),
              body: body,
            )
            .timeout(Duration(seconds: _timeOutDuration));
        return _response;

      /// delete method
      case METHOD.delete:
        _response = await client
            .delete(
              BaseClientConfig.parseHttpsUri(parameter: queryParameters),
              headers: BaseClientConfig.headers(),
              body: body,
            )
            .timeout(Duration(seconds: _timeOutDuration));
        return _response;
      default:
        return _response;
    }
  }
}
