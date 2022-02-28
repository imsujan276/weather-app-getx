import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackBar {
  static void defaultSnackBar(String message) {
    Get.showSnackbar(GetSnackBar(
      message: message,
      duration: const Duration(milliseconds: 2000),
      dismissDirection: DismissDirection.horizontal,
    ));
  }
}
