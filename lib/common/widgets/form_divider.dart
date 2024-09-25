import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class TFormDivider extends StatelessWidget {
  const TFormDivider({
    super.key,
    required this.dividerText,
  });

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
              color: dark ? TColors.dividerColor : TColors.dividerColor,
              thickness: 1,
              indent: 36,
              endIndent: 5),
        ),
        Text(dividerText,
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .apply(color: TColors.darkerGrey)),
        Flexible(
          child: Divider(
              color: dark ? TColors.dividerColor : TColors.dividerColor,
              thickness: 1,
              indent: 5,
              endIndent: 36),
        ),
      ],
    );
  }
}
