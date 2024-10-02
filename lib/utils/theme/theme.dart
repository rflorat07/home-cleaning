import 'package:flutter/material.dart';
import 'package:home_cleaning/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:home_cleaning/utils/theme/custom_themes/navigation_bar_theme.dart';
import 'package:home_cleaning/utils/utils.dart';

import 'custom_themes/dropdown_menu_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Inter',
    brightness: Brightness.light,
    primaryColor: TColors.primary,
    textTheme: TTextTheme.lightTextTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetThemeData,
    dropdownMenuTheme: TDropdownMenuTheme.lightDropdownMenuThemeData,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
    navigationBarTheme: TNavigationBarTheme.lightNavigationBarThemeData,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Inter',
    brightness: Brightness.dark,
    primaryColor: TColors.primary,
    textTheme: TTextTheme.darkTextTheme,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetThemeData,
    dropdownMenuTheme: TDropdownMenuTheme.darkDropdownMenuThemeData,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
    navigationBarTheme: TNavigationBarTheme.darkNavigationBarThemeData,
  );
}
