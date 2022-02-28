import 'dart:io';

class BaseClientConfig {
  /// base client authority
  static const String _apiKey = "6214dbb9ba3d41aba2c92041222402";

  /// base client authority
  static const String _baseClientAuthority = "api.weatherapi.com";

  /// unincoded path
  static const String _unencodedPath = "/v1/current.json";

  /// query parameters
  static Map<String, String> queryParma = {"key": _apiKey};

  /// query parameters
  static Map<String, String> queryParameters(
      {Map<String, String>? queryParameters}) {
    queryParma.addAll(queryParameters ?? {});
    return queryParma;
  }

  /// headers
  static Map<String, String> headers() {
    Map<String, String> _headers = {
      HttpHeaders.acceptHeader: "application/json"
    };
    return _headers;
  }

  /// parse https uri
  static Uri parseHttpsUri({Map<String, String>? parameter}) => Uri.https(
        _baseClientAuthority,
        _unencodedPath,
        queryParameters(queryParameters: parameter),
      );
}
