import 'package:get/get.dart';
import 'package:weather_app/src/controllers/help_page_controller/help_page_controller.dart';
import 'package:weather_app/src/controllers/home_page_controller/home_page_controller.dart';

class InitialBindings extends Bindings {
  InitialBindings._() {
    dependencies();
  }

  factory InitialBindings() => InitialBindings._();

  @override
  void dependencies() {
    Get.lazyPut(() => HelpPageController(), fenix: true);
    Get.lazyPut(() => HomePageController(), fenix: true);
  }
}
