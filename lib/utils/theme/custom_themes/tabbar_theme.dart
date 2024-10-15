import 'package:flutter/material.dart';
import 'package:home_cleaning/utils/utils.dart';

class TTabBarTheme {
  TTabBarTheme._();

  static TabBarTheme lightTabBarTheme = TabBarTheme(
    indicator: const BoxDecoration(
      border: Border(
        bottom: BorderSide(width: TSizes.size4, color: TColors.green),
      ),
    ),
    indicatorSize: TabBarIndicatorSize.tab,
    dividerColor: Colors.black.withOpacity(0.1),
    labelStyle: const TextStyle(
        color: TColors.green,
        fontSize: TSizes.fontSize14,
        fontWeight: FontWeight.w500),
    unselectedLabelStyle: const TextStyle(
        color: TColors.dark,
        fontSize: TSizes.fontSize14,
        fontWeight: FontWeight.w400),
  );

  static TabBarTheme darkTabBarTheme = TabBarTheme(
    indicator: const BoxDecoration(
      border: Border(
        bottom: BorderSide(width: TSizes.size4, color: TColors.green),
      ),
    ),
    indicatorColor: TColors.green,
    indicatorSize: TabBarIndicatorSize.tab,
    dividerColor: Colors.black.withOpacity(0.1),
    labelStyle: const TextStyle(
        color: TColors.green,
        fontSize: TSizes.fontSize14,
        fontWeight: FontWeight.w500),
    unselectedLabelStyle: const TextStyle(
        color: TColors.dark,
        fontSize: TSizes.fontSize14,
        fontWeight: FontWeight.w400),
  );
}
