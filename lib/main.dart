import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:weather_app/src/configs/bindings.dart';
import 'package:weather_app/src/configs/routes/routes.dart';
import 'package:weather_app/src/configs/routes/routes_const.dart';
import 'package:weather_app/src/core/service_locators.dart';

void main() async {
  /// get_it setup
  slSetUp();

  /// get_storage setup
  await GetStorage.init('weather_storage');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesName.homePage,
      getPages: Routes.getPages(),
      initialBinding: InitialBindings(),
    );
  }
}
