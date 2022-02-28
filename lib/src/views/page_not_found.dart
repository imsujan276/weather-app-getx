import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const Text(
          "404 Not Found!",
          textScaleFactor: 4.6,
        ),
        ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: const Text("Retry"),
        ),
      ]),
    );
  }
}
