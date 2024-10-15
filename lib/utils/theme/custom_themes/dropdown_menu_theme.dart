import 'package:flutter/material.dart';
import 'package:home_cleaning/utils/utils.dart';

class TDropdownMenuTheme {
  TDropdownMenuTheme._();

  static DropdownMenuThemeData lightDropdownMenuThemeData =
      const DropdownMenuThemeData(
    textStyle: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: TSizes.fontSize14,
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.only(left: 0.0),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
      ),
    ),
  );

  static DropdownMenuThemeData darkDropdownMenuThemeData =
      const DropdownMenuThemeData(
    textStyle: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: TSizes.fontSize14,
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.only(left: 0.0),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
      ),
    ),
  );
}
