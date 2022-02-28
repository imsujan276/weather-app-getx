import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/src/configs/color_picker.dart';
import 'package:weather_app/src/configs/spacing.dart';

class WeatherInfoWdiget extends StatelessWidget {
  const WeatherInfoWdiget({
    required this.tempC,
    required this.tempText,
    required this.imgUrl,
    Key? key,
  }) : super(key: key);
  final double tempC;
  final String tempText;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // temperature in celcius
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$tempC",
              style: const TextStyle(color: ColorPicker.black383836),
              textScaleFactor: 4.6,
            ),
            Spacing.sizedBoxW_04(),
            const Text(
              "℃",
              style: TextStyle(color: ColorPicker.blue0052CC),
              textScaleFactor: 2.4,
            ),
            Spacing.sizedBoxW_04(),
            imgUrl == ""
                ? const SizedBox.shrink()
                : CachedNetworkImage(
                    imageUrl: 'https:$imgUrl',
                    fit: BoxFit.scaleDown,
                  ),
          ],
        ),
        Spacing.sizedBoxH_12(),

        // temperature in text
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
          decoration: BoxDecoration(
            color: ColorPicker.successColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            tempText,
            style: const TextStyle(color: ColorPicker.whiteffffff),
            textScaleFactor: 2,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
