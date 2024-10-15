import 'package:flutter/material.dart';
import 'package:home_cleaning/utils/utils.dart';

class TListTileTheme {
  TListTileTheme._();

  static ListTileThemeData lightListTileThemeData = const ListTileThemeData(
    iconColor: TColors.primary,
    titleTextStyle: TextStyle(
        fontSize: TSizes.fontSize16,
        fontWeight: FontWeight.normal,
        color: TColors.secondary),
    contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
    shape: Border(
      bottom: BorderSide(color: TColors.borderPrimary, width: 0.5),
    ),
  );

  static ListTileThemeData darkListTileThemeData = const ListTileThemeData(
    iconColor: TColors.primary,
    titleTextStyle: TextStyle(
        fontSize: TSizes.fontSize16,
        fontWeight: FontWeight.normal,
        color: TColors.secondary),
    contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
    shape: Border(
      bottom: BorderSide(color: TColors.borderPrimary, width: 0.5),
    ),
  );
}
