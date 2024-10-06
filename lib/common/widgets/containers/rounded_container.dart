import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class TRoundedContainer extends StatelessWidget {
  const TRoundedContainer({
    super.key,
    this.child,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.imageUrl,
    this.showBorder = false,
    this.fit = BoxFit.cover,
    this.radius = TSizes.cardRadiusLg,
    this.backgroundColor = TColors.white,
    this.borderColor = TColors.borderPrimary,
  });

  final BoxFit? fit;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final String? imageUrl;
  final Color borderColor;
  final Color backgroundColor;
  final double? width, height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(radius),
          border: showBorder ? Border.all(color: borderColor) : null,
          image: imageUrl != null
              ? DecorationImage(image: AssetImage(imageUrl ?? ''), fit: fit)
              : null),
      child: child,
    );
  }
}
