import 'package:flutter/material.dart';

import '../../../../../utils/utils.dart';

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            TTexts.loginTitle,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: TSizes.md),
          Text(
            TTexts.loginSubTitle,
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .apply(color: TColors.darkerGrey),
          ),
        ],
      ),
    );
  }
}
