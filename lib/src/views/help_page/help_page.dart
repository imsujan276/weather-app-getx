import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/src/configs/routes/routes_const.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Help Page"),
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "App to show weather info for you",
              style: TextStyle(
                fontSize: 22,
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              width: Get.width,
              child: ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text("OK"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
