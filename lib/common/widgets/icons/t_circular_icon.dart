import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class TCircularIcon extends StatelessWidget {
  const TCircularIcon({
    super.key,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.onPressed,
    this.iconColor,
    required this.icon,
    this.backgroundColor,
    this.size = TSizes.lg,
    this.showBorder = false,
    this.borderRadius = 100.0,
    this.borderColor = TColors.borderPrimary,
  });

  final IconData icon;
  final bool showBorder;
  final Color? iconColor;
  final Color borderColor;
  final double borderRadius;
  final Color? backgroundColor;
  final VoidCallback? onPressed;
  final double? width, height, size;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor ??
            (dark
                ? TColors.black.withOpacity(0.9)
                : TColors.white.withOpacity(0.9)),
        borderRadius: BorderRadius.circular(borderRadius),
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: IconButton(
        padding: const EdgeInsets.all(0.0),
        onPressed: onPressed,
        icon: Icon(icon, color: iconColor, size: size),
      ),
    );
  }
}
