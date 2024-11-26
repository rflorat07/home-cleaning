import 'package:flutter/material.dart';

import '../../utils.dart';

class TExpansionTileTheme {
  TExpansionTileTheme._();

  static ExpansionTileThemeData lightExpansionTileThemeData =
      ExpansionTileThemeData(
    textColor: TColors.green,
    iconColor: TColors.green,
    collapsedIconColor: TColors.green,
    tilePadding: const EdgeInsets.symmetric(horizontal: TSizes.size16),
    childrenPadding: const EdgeInsets.all(TSizes.size16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(TSizes.size8),
      side: const BorderSide(width: 0.5, color: TColors.borderPrimary),
    ),
    collapsedShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(TSizes.size8),
      side: const BorderSide(width: 0.5, color: TColors.borderPrimary),
    ),
  );

  static ExpansionTileThemeData darkExpansionTileThemeData =
      ExpansionTileThemeData(
    textColor: TColors.green,
    iconColor: TColors.green,
    collapsedIconColor: TColors.green,
    tilePadding: const EdgeInsets.symmetric(horizontal: TSizes.size16),
    childrenPadding: const EdgeInsets.all(TSizes.size16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(TSizes.size8),
      side: const BorderSide(width: 0.5, color: TColors.borderPrimary),
    ),
    collapsedShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(TSizes.size8),
      side: const BorderSide(width: 0.5, color: TColors.borderPrimary),
    ),
  );
}
