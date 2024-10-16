import 'package:flutter/material.dart';
import 'package:home_cleaning/utils/utils.dart';

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
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    dividerTheme: TDividerTheme.lightDividerThemeData,
    listTileTheme: TListTileTheme.lightListTileThemeData,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetThemeData,
    dropdownMenuTheme: TDropdownMenuTheme.lightDropdownMenuThemeData,
    filledButtonTheme: TFilledButtonTheme.lightFilledButtonThemeData,
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
    chipTheme: TChipTheme.darkChipThemeData,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    tabBarTheme: TTabBarTheme.darkTabBarTheme,
    checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
    dividerTheme: TDividerTheme.darkDividerThemeData,
    listTileTheme: TListTileTheme.darkListTileThemeData,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetThemeData,
    dropdownMenuTheme: TDropdownMenuTheme.darkDropdownMenuThemeData,
    filledButtonTheme: TFilledButtonTheme.darkFilledButtonThemeData,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
    navigationBarTheme: TNavigationBarTheme.darkNavigationBarThemeData,
  );
}
