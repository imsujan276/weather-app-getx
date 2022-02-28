import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:weather_app/src/configs/bindings.dart';
import 'package:weather_app/src/configs/routes/routes.dart';
import 'package:weather_app/src/configs/routes/routes_const.dart';
import 'package:weather_app/src/core/service_locators.dart';

void main() {
  slSetUp();
  testWidgets("home screen widgets test", (tester) async {
    await tester.pumpWidget(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesName.homePage,
      getPages: Routes.getPages(),
      initialBinding: InitialBindings(),
    ));
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    await tester.pump(const Duration(seconds: 1));
    expect(find.text('Weather App'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.byType(TextFormField), findsOneWidget);
  });
}
