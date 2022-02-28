import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:weather_app/src/configs/bindings.dart';
import 'package:weather_app/src/configs/routes/routes.dart';
import 'package:weather_app/src/configs/routes/routes_const.dart';
import 'package:weather_app/src/core/service_locators.dart';

void main() {
  slSetUp();
  testWidgets("help screen widgets test", (tester) async {
    await tester.runAsync(() async {
      await tester.pumpWidget(GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RoutesName.helpPage,
        getPages: Routes.getPages(),
        initialBinding: InitialBindings(),
      ));
    });
    expect(find.byKey(const ValueKey('asset_image')), findsOneWidget);
    expect(find.text("We show weather for you"), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
  });
}
