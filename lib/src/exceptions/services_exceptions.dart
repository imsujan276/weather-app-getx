import 'package:http/http.dart' as http;

class ServiceException implements Exception {
  ServiceException(this.prefix, this.response);
  final http.Response response;
  final String? prefix;

  @override
  String toString() => "$prefix$response";
}

class UnknownException extends ServiceException {
  UnknownException(http.Response response)
      : super("Unknown exception: ", response);
}

class NetworkException extends ServiceException {
  NetworkException(http.Response response)
      : super("Network exception: ", response);
}

class ServerException extends ServiceException {
  ServerException(http.Response response)
      : super("Server exception: ", response);
}

class BadRequestException extends ServiceException {
  BadRequestException(http.Response response)
      : super("Bad Request: ", response);
}

class TimeoutException extends ServiceException {
  TimeoutException(http.Response response) : super("Timeout: ", response);
}
