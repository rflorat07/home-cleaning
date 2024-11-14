import 'package:flutter/material.dart';

import '../../utils.dart';

class TRadioThemeData {
  TRadioThemeData._();

  static RadioThemeData lightRadioThemeData = RadioThemeData(
    fillColor: WidgetStateProperty.resolveWith<Color>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return TColors.green;
        }
        return TColors.darkerGrey;
      },
    ),
  );

  static RadioThemeData darkRadioThemeData = RadioThemeData(
    fillColor: WidgetStateProperty.resolveWith<Color>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return TColors.darkerGrey;
        }
        return TColors.green;
      },
    ),
  );
}
