import 'package:cached_network_image/cached_network_image.dart';
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
    this.borderRadius,
    this.showBorder = false,
    this.fit = BoxFit.cover,
    this.radius = TSizes.size16,
    this.isBorderRadiusCircular = true,
    this.backgroundColor = TColors.white,
    this.borderColor = TColors.borderPrimary,
  });

  final BoxFit? fit;
  final double radius;
  final Widget? child;
  final String? imageUrl;
  final Color borderColor;
  final Color backgroundColor;
  final double? width, height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? borderRadius;
  final bool showBorder, isBorderRadiusCircular;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: isBorderRadiusCircular
            ? BorderRadius.circular(radius)
            : borderRadius,
        border: showBorder ? Border.all(color: borderColor) : null,
        image: imageUrl != null
            ? DecorationImage(
                image: CachedNetworkImageProvider(imageUrl!), fit: fit)
            : null,
      ),
      child: child,
    );
  }
}
