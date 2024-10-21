import 'package:flutter/material.dart';

import '../../utils.dart';

class TChipTheme {
  TChipTheme._();

  static ChipThemeData lightChipThemeData = ChipThemeData(
    elevation: 0,
    brightness: Brightness.dark,
    showCheckmark: false,
    side: BorderSide.none,
    selectedColor: TColors.primary,
    disabledColor: TColors.whiteSmoke,
    backgroundColor: TColors.whiteSmoke,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(100.0),
    ),
    labelStyle: TextStyle(
      fontSize: TSizes.fontSize16,
      color: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return TColors.white;
        }
        return TColors.darkerGrey;
      }),
    ),
  );

  static ChipThemeData darkChipThemeData = ChipThemeData(
    elevation: 0,
    showCheckmark: false,
    side: BorderSide.none,
    selectedColor: TColors.primary,
    disabledColor: TColors.whiteSmoke,
    backgroundColor: TColors.whiteSmoke,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(100.0),
    ),
    labelStyle: TextStyle(
      fontSize: TSizes.fontSize16,
      color: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return TColors.white;
        }
        return TColors.darkerGrey;
      }),
    ),
  );
}
