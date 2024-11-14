import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';

import '../../utils.dart';

class TSliderThemeData {
  TSliderThemeData._();

  static SliderThemeData lightSliderThemeData = SliderThemeData(
    trackHeight: TSizes.size6,
    thumbColor: TColors.green,
    activeTrackColor: TColors.green,
    inactiveTrackColor: TColors.lightSilver,
    activeTickMarkColor: TColors.green,
    secondaryActiveTrackColor: TColors.lightSilver,
    overlayShape: SliderComponentShape.noThumb,
    showValueIndicator: ShowValueIndicator.always,
  );

  static SliderThemeData darkSliderThemeData = SliderThemeData(
    trackHeight: TSizes.size6,
    thumbColor: TColors.green,
    activeTrackColor: TColors.green,
    inactiveTrackColor: TColors.lightSilver,
    activeTickMarkColor: TColors.green,
    secondaryActiveTrackColor: TColors.lightSilver,
    overlayShape: SliderComponentShape.noThumb,
    showValueIndicator: ShowValueIndicator.always,
  );

  static SfRangeSliderThemeData lightSfRangeSliderThemeData =
      SfRangeSliderThemeData(
    inactiveTrackHeight: TSizes.size6,
    thumbColor: TColors.green,
    activeTrackColor: TColors.green,
    thumbRadius: 12.0,
    inactiveTrackColor: TColors.lightSilver,
    thumbStrokeWidth: 3,
    thumbStrokeColor: Colors.white,
    activeLabelStyle: const TextStyle().copyWith(
        fontSize: 12.0, fontWeight: FontWeight.w500, color: TColors.dark),
    inactiveLabelStyle: const TextStyle().copyWith(
        fontSize: 12.0, fontWeight: FontWeight.w500, color: TColors.dark),
  );

  static SfRangeSliderThemeData darkSfRangeSliderThemeData =
      SfRangeSliderThemeData(
    inactiveTrackHeight: TSizes.size6,
    thumbColor: TColors.green,
    activeTrackColor: TColors.green,
    thumbRadius: 12.0,
    inactiveTrackColor: TColors.lightSilver,
    thumbStrokeWidth: 3,
    thumbStrokeColor: Colors.white,
    activeLabelStyle: const TextStyle().copyWith(
        fontSize: 12.0, fontWeight: FontWeight.w500, color: TColors.dark),
    inactiveLabelStyle: const TextStyle().copyWith(
        fontSize: 12.0, fontWeight: FontWeight.w500, color: TColors.dark),
  );
}
