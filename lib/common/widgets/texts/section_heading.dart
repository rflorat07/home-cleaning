import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class TSectionHeading extends StatelessWidget {
  const TSectionHeading({
    super.key,
    this.onPressed,
    this.textColor,
    this.buttonColor,
    required this.title,
    this.showActionButton = true,
    this.buttonTitle = TTexts.viewAll,
    this.vertical = 0.0,
    this.horizontal = 0.0,
  });

  final Color? textColor, buttonColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;
  final double vertical, horizontal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: Theme.of(context).textTheme.headlineSmall!.apply(
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
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: buttonColor ?? TColors.green),
                ))
        ],
      ),
    );
  }
}
