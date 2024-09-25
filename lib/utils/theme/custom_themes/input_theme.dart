import 'package:flutter/material.dart';

import '../../utils.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: TColors.black,
    suffixIconColor: TColors.black,
    constraints: const BoxConstraints(maxHeight: TSizes.inputMaxHeight),
    contentPadding:
        const EdgeInsets.symmetric(vertical: TSizes.sm, horizontal: TSizes.md),
    floatingLabelBehavior: FloatingLabelBehavior.never,
    labelStyle: const TextStyle()
        .copyWith(fontSize: TSizes.fontSizeSm, color: TColors.darkerGrey),
    hintStyle: const TextStyle()
        .copyWith(fontSize: TSizes.fontSizeSm, color: TColors.darkerGrey),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle:
        const TextStyle().copyWith(color: TColors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: TColors.borderPrimary),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: TColors.borderPrimary),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: TColors.borderPrimary),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: TColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: TColors.error),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: TColors.darkerGrey,
    suffixIconColor: TColors.darkerGrey,
    labelStyle: const TextStyle()
        .copyWith(fontSize: TSizes.fontSizeSm, color: TColors.white),
    hintStyle: const TextStyle()
        .copyWith(fontSize: TSizes.fontSizeSm, color: TColors.white),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle:
        const TextStyle().copyWith(color: TColors.white.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: TColors.darkerGrey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: TColors.darkerGrey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: TColors.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: TColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: TColors.error),
    ),
  );
}
