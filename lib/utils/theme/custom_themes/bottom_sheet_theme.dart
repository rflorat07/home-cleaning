import 'package:flutter/material.dart';
import 'package:home_cleaning/utils/utils.dart';

class TBottomSheetTheme {
  TBottomSheetTheme._();

  static BottomSheetThemeData lightBottomSheetThemeData = BottomSheetThemeData(
    showDragHandle: false,
    backgroundColor: TColors.primary,
    modalBackgroundColor: Colors.white,
    constraints: const BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(TSizes.size30)),
  );

  static BottomSheetThemeData darkBottomSheetThemeData = BottomSheetThemeData(
    showDragHandle: false,
    backgroundColor: Colors.black,
    modalBackgroundColor: Colors.black,
    constraints: const BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(TSizes.size30)),
  );
}
