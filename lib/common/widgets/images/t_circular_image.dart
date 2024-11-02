import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../utils/utils.dart';
import '../shimmer/shimmer.dart';

class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.overlayColor,
    this.backgroundColor,
    required this.image,
    this.fit = BoxFit.cover,
    this.padding = TSizes.size8,
    this.isNetworkImage = false,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ??
            (THelperFunctions.isDarkMode(context)
                ? TColors.black
                : TColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: isNetworkImage
            ? CachedNetworkImage(
                fit: fit,
                color: overlayColor,
                imageUrl: image,
                progressIndicatorBuilder: (context, url, progress) =>
                    TShimmerEffect(width: width, height: height),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              )
            : Image(
                fit: fit,
                image: AssetImage(image),
                color: overlayColor,
              ),
      ),
    );
  }
}
