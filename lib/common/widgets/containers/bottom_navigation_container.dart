import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class TBottomNavigationContainer extends StatelessWidget {
  const TBottomNavigationContainer({
    super.key,
    this.child,
    this.padding,
    this.onPressed,
    this.decoration,
    required this.text,
    this.height = TSizes.size48,
  });

  final String text;
  final double height;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final Decoration? decoration;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: padding ??
            const EdgeInsets.symmetric(
                horizontal: TSizes.defaultSpace, vertical: TSizes.size12),
        decoration: decoration ??
            const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(TSizes.size16),
                topRight: Radius.circular(TSizes.size16),
              ),
              border: Border(
                top: BorderSide(color: TColors.borderPrimary),
                left: BorderSide(color: TColors.borderPrimary),
                right: BorderSide(color: TColors.borderPrimary),
              ),
            ),
        child: SizedBox(
          height: height,
          child: FilledButton(
            onPressed: onPressed,
            style: ButtonStyle(
              padding: WidgetStateProperty.all(
                const EdgeInsets.symmetric(
                    horizontal: TSizes.size50, vertical: TSizes.size12),
              ),
              textStyle: WidgetStateProperty.all(
                Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .apply(color: TColors.white),
              ),
            ),
            child: child ?? Text(text),
          ),
        ),
      ),
    );
  }
}
