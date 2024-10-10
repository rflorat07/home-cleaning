import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class TCarouselView extends StatelessWidget {
  const TCarouselView({
    super.key,
    required this.children,
    required this.maxHeight,
    required this.widthFactor,
    this.showBorderSide = false,
    this.backgroundColor = TColors.white,
    this.overlayColor = Colors.transparent,
    this.borderSideColor = TColors.borderPrimary,
    this.borderRadius = TSizes.carouselBorderRadius,
    this.padding = const EdgeInsets.only(left: TSizes.defaultSpace),
  });

  final Color? overlayColor, backgroundColor;
  final List<Widget> children;
  final EdgeInsets padding;
  final double widthFactor, maxHeight, borderRadius;
  final Color borderSideColor;
  final bool showBorderSide;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: maxHeight),
      child: CarouselView(
        itemSnapping: true,
        overlayColor: WidgetStateProperty.all(overlayColor),
        shrinkExtent: THelperFunctions.screenWidth(context) * widthFactor,
        itemExtent: THelperFunctions.screenWidth(context) * widthFactor,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: showBorderSide
                ? BorderSide(color: borderSideColor)
                : BorderSide.none),
        padding: padding,
        children: children,
      ),
    );
  }
}
