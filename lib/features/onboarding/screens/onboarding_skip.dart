import 'package:flutter/material.dart';

import '../../../utils/utils.dart';
import '../controllers/onboarding.controller.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: TDeviceUtils.getAppBarHeight(),
      right: TSizes.defaultSpace,
      child: TextButton(
        onPressed: () => OnBoardingController.instance.skipPage(),
        child: Text(
          'Skip',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: TColors.primary),
        ),
      ),
    );
  }
}
