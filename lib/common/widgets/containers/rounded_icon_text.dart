import 'package:flutter/material.dart';

import '../../../utils/utils.dart';
import '../icons/t_circular_icon.dart';

class TRoundedIconText extends StatelessWidget {
  const TRoundedIconText({
    super.key,
    required this.label,
    required this.icon,
    this.child,
    this.style,
    this.onPressed,
    this.size = TSizes.size24,
    this.width = TSizes.size64,
    this.height = TSizes.size64,
    this.color = TColors.green,
    this.backgroundColor = TColors.whiteSmoke,
  });

  final double size;
  final IconData icon;
  final double? width, height;
  final String label;
  final VoidCallback? onPressed;
  final Color color, backgroundColor;
  final TextStyle? style;
  final Widget? child;

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

        const SizedBox(height: TSizes.size4),

        // Text
        SizedBox(
          width: width,
          child: Text(
            label,
            maxLines: 1,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: style ??
                Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontWeight: FontWeight.w500),
          ),
        ),

        Container(
          child: child,
        )
      ],
    );
  }
}
