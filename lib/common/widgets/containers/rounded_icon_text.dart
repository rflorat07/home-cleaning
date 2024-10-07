import 'package:flutter/material.dart';

import '../../../utils/utils.dart';
import '../icons/t_circular_icon.dart';

class TRoundedIconText extends StatelessWidget {
  const TRoundedIconText({
    super.key,
    required this.label,
    required this.icon,
    this.onPressed,
    this.width = TSizes.iconXL,
    this.height = TSizes.iconXL,
    this.size = TSizes.iconMd,
    this.color = TColors.green,
    this.backgroundColor = TColors.whiteSmoke,
  });

  final double size;
  final String label;
  final IconData icon;
  final double? width, height;
  final VoidCallback? onPressed;
  final Color color, backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Circular Icon
        TCircularIcon(
          icon: icon,
          width: width,
          height: height,
          size: size,
          onPressed: onPressed,
          iconColor: color,
          backgroundColor: backgroundColor,
        ),

        const SizedBox(height: TSizes.xs),

        // Text
        SizedBox(
          width: width,
          child: Text(
            label,
            maxLines: 1,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }
}
