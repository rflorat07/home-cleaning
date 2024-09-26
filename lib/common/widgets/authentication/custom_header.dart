import 'package:flutter/material.dart';

import '../../../../../utils/utils.dart';

class TCustomHeader extends StatelessWidget {
  const TCustomHeader({super.key, required this.title, required this.subTitle});

  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: TSizes.md),
        Text(
          subTitle,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .apply(color: TColors.darkerGrey),
        ),
      ],
    );
  }
}
