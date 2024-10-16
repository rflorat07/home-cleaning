import 'package:flutter/material.dart';

import '../../utils.dart';

class TFilledButtonTheme {
  TFilledButtonTheme._();

  static FilledButtonThemeData lightFilledButtonThemeData =
      FilledButtonThemeData(
    style: ButtonStyle(
      textStyle: WidgetStatePropertyAll(
        TTextTheme.lightTextTheme.titleMedium!.apply(color: TColors.white),
      ),
      backgroundColor: const WidgetStatePropertyAll(TColors.green),
    ),
  );

  static FilledButtonThemeData darkFilledButtonThemeData =
      FilledButtonThemeData(
    style: ButtonStyle(
      textStyle: WidgetStatePropertyAll(
        TTextTheme.lightTextTheme.titleMedium!.apply(color: TColors.white),
      ),
      backgroundColor: const WidgetStatePropertyAll(TColors.green),
    ),
  );
}
