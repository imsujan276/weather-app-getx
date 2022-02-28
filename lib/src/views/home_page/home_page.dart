import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:weather_app/src/configs/color_picker.dart';
import 'package:weather_app/src/configs/routes/routes_const.dart';
import 'package:weather_app/src/configs/spacing.dart';
import 'package:weather_app/src/controllers/base_controller.dart';
import 'package:weather_app/src/controllers/home_page_controller/home_page_controller.dart';
import 'package:weather_app/src/views/home_page/components/weather_info_widget.dart';

class HomePage extends GetView<HomePageController> {
  HomePage({Key? key}) : super(key: key);

  final textFieldDebouncer =
      Debouncer(delay: const Duration(milliseconds: 500));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(RoutesName.helpPage);
            },
            icon: const Icon(Icons.info_outline),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          Focus.of(Get.context!).unfocus();
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Obx(() {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: controller.textController,
                  // onChanged: (value) {
                  //   textFieldDebouncer.call(() {
                  //     controller.fetchWeatherInfo(value);
                  //   });
                  // },
                  decoration: const InputDecoration(
                      hintText: "place or, geo-coordinates"),
                ),
                Spacing.sizedBoxH_08(),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          if (controller.textController.text.isNotEmpty) {
                            controller.fetchWeatherInfo(
                                controller.textController.text);
                          }
                        },
                        child:
                            Text(controller.isSaved.isTrue ? "Update" : "Save"),
                      ),
                    ),
                    if (controller.textController.text.isNotEmpty) ...[
                      Spacing.sizedBoxW_26(),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            controller.resetData();
                          },
                          child: const Text("Remove"),
                          style: ElevatedButton.styleFrom(
                              primary: ColorPicker.dangerColor),
                        ),
                      ),
                    ],
                  ],
                ),
                Spacing.sizedBoxH_40(),

                // weather info
                controller.weatherState.value == ViewState.busy
                    ? const Center(child: CircularProgressIndicator())
                    : WeatherInfoWdiget(
                        key: const Key('weather_info'),
                        imgUrl: controller
                                .weatherModel.value.current?.condition?.icon ??
                            "",
                        tempC:
                            controller.weatherModel.value.current?.tempC ?? 0,
                        tempText: controller
                                .weatherModel.value.current?.condition?.text ??
                            "--"),
              ],
            );
          }),
        ),
      ),
    );
  }
}
