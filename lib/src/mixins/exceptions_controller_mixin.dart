import 'dart:async';
import 'dart:convert';

import 'package:weather_app/src/exceptions/services_exceptions.dart';
import 'package:weather_app/src/views/global_components/custom_snackbar.dart';

mixin ExceptionsControllerMixin {
  Future<void> exceptionsController(
    Function() query, {
    Function(dynamic error)? exceptionsHandler,
  }) async {
    try {
      await query();
    } on NetworkException catch (e) {
      if (exceptionsHandler != null) exceptionsHandler(e.response);
      CustomSnackBar.defaultSnackBar(
          "Network : ${jsonDecode(e.response.body)['error']['message']}");
    } on TimeoutException catch (e) {
      if (exceptionsHandler != null) exceptionsHandler(e.response);
      CustomSnackBar.defaultSnackBar(
          "Timeout : ${ExceptionsConst.timeoutExceptionStr}");
    } on BadRequestException catch (e) {
      if (exceptionsHandler != null) exceptionsHandler(e.response);
      CustomSnackBar.defaultSnackBar(
          "Bad Request : ${jsonDecode(e.response.body)['error']['message']}");
    } on UnknownException catch (e) {
      if (exceptionsHandler != null) exceptionsHandler(e.response);
      CustomSnackBar.defaultSnackBar(
          "Unknown Exception : ${jsonDecode(e.response.body)['error']['message']}");
    } on Exception catch (e) {
      if (exceptionsHandler != null) exceptionsHandler(e.toString());
      CustomSnackBar.defaultSnackBar("Exception : ${e.toString()}");
    } catch (e) {
      if (exceptionsHandler != null) exceptionsHandler(e..toString());
      CustomSnackBar.defaultSnackBar("Error : ${e.toString()}");
    }
  }
}

/// exceptions const strings
class ExceptionsConst {
  static const socketExceptionStr =
      "socket exception no internet connection ...";
  static const timeoutExceptionStr = "service not responding in time ...";
  static const serverExceptionStr =
      "error occured while communicating with server ...";
  static const fetchDataExceptionStr =
      "error occured while fetching data from service ...";
  static const badRequestExceptionStr = "bad request exception ...";
}
