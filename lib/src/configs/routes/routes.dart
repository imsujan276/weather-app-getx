import 'package:get/get.dart';
import 'package:weather_app/src/configs/routes/routes_const.dart';
import 'package:weather_app/src/views/help_page/help_page.dart';
import 'package:weather_app/src/views/home_page/home_page.dart';
import 'package:weather_app/src/views/page_not_found.dart';

class Routes {
  static List<GetPage> getPages() {
    return [
      GetPage(name: RoutesName.helpPage, page: () => const HelpPage()),
      GetPage(name: RoutesName.homePage, page: () => HomePage()),
      GetPage(name: RoutesName.pageNotFound, page: () => const PageNotFound()),
    ];
  }
}
