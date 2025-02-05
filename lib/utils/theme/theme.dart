import 'package:flutter/material.dart';

import '../utils.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Inter',
    brightness: Brightness.light,
    primaryColor: TColors.primary,
    textTheme: TTextTheme.lightTextTheme,
    scaffoldBackgroundColor: Colors.white,
    chipTheme: TChipTheme.lightChipThemeData,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    tabBarTheme: TTabBarTheme.lightTabBarTheme,
    radioTheme: TRadioThemeData.lightRadioThemeData,
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    dividerTheme: TDividerTheme.lightDividerThemeData,
    sliderTheme: TSliderThemeData.lightSliderThemeData,
    listTileTheme: TListTileTheme.lightListTileThemeData,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetThemeData,
    dropdownMenuTheme: TDropdownMenuTheme.lightDropdownMenuThemeData,
    filledButtonTheme: TFilledButtonTheme.lightFilledButtonThemeData,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
    navigationBarTheme: TNavigationBarTheme.lightNavigationBarThemeData,
    expansionTileTheme: TExpansionTileTheme.lightExpansionTileThemeData,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Inter',
    brightness: Brightness.dark,
    primaryColor: TColors.primary,
    textTheme: TTextTheme.darkTextTheme,
    scaffoldBackgroundColor: Colors.black,
    chipTheme: TChipTheme.darkChipThemeData,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    tabBarTheme: TTabBarTheme.darkTabBarTheme,
    radioTheme: TRadioThemeData.darkRadioThemeData,
    checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
    dividerTheme: TDividerTheme.darkDividerThemeData,
    sliderTheme: TSliderThemeData.darkSliderThemeData,
    listTileTheme: TListTileTheme.darkListTileThemeData,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetThemeData,
    dropdownMenuTheme: TDropdownMenuTheme.darkDropdownMenuThemeData,
    filledButtonTheme: TFilledButtonTheme.darkFilledButtonThemeData,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
    navigationBarTheme: TNavigationBarTheme.darkNavigationBarThemeData,
    expansionTileTheme: TExpansionTileTheme.darkExpansionTileThemeData,
  );
}
