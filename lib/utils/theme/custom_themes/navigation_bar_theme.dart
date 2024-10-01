import 'package:flutter/material.dart';
import 'package:home_cleaning/utils/utils.dart';

class TNavigationBarTheme {
  TNavigationBarTheme._();

  static NavigationBarThemeData lightNavigationBarThemeData =
      NavigationBarThemeData(
    elevation: 0,
    height: TSizes.navigationMenuHeight,
    backgroundColor: Colors.transparent,
    indicatorColor: Colors.transparent,
    overlayColor: const MaterialStatePropertyAll(Colors.transparent),
    labelTextStyle: MaterialStateProperty.resolveWith(
      (states) {
        return (states.contains(MaterialState.selected))
            ? const TextStyle(
                color: TColors.green,
                fontSize: 10.0,
                fontWeight: FontWeight.w500)
            : const TextStyle(
                color: TColors.darkerGrey,
                fontSize: 10.0,
                fontWeight: FontWeight.w500);
      },
    ),
  );

  static NavigationBarThemeData darkNavigationBarThemeData =
      NavigationBarThemeData(
    elevation: 0,
    height: TSizes.navigationMenuHeight,
    backgroundColor: Colors.transparent,
    indicatorColor: Colors.transparent,
    overlayColor: const MaterialStatePropertyAll(Colors.transparent),
    indicatorShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.0),
    ),
    labelTextStyle: MaterialStateProperty.resolveWith(
      (states) {
        return (states.contains(MaterialState.selected))
            ? const TextStyle(
                color: TColors.green,
                fontSize: 10.0,
                fontWeight: FontWeight.w500)
            : const TextStyle(
                color: TColors.darkerGrey,
                fontSize: 10.0,
                fontWeight: FontWeight.w500);
      },
    ),
  );
}
