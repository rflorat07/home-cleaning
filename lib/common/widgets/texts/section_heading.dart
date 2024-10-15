import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class TSectionHeading extends StatelessWidget {
  const TSectionHeading({
    super.key,
    this.textStyle,
    this.onPressed,
    this.textColor,
    this.buttonColor,
    required this.title,
    this.vertical = 0.0,
    this.textButtonStyle,
    this.horizontal = 0.0,
    this.showActionButton = true,
    this.buttonTitle = TTexts.seeAll,
  });

  final Color? textColor, buttonColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;
  final double vertical, horizontal;
  final TextStyle? textStyle, textButtonStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: textStyle ??
                  Theme.of(context).textTheme.headlineSmall!.apply(
                        color: textColor,
                      ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis),
          if (showActionButton)
            TextButton(
                onPressed: onPressed,
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  buttonTitle,
                  style: textButtonStyle ??
                      Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .apply(color: buttonColor ?? TColors.green),
                ))
        ],
      ),
    );
  }
}
