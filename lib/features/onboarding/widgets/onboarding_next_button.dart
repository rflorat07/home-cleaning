import 'package:flutter/material.dart';

import '../../../utils/utils.dart';
import '../controllers/onboarding.controller.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Positioned(
      right: double.minPositive,
      bottom: TDeviceUtils.getBottomNavigationBarHeight() + 15,
      child: ElevatedButton(
        onPressed: () => OnBoardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: EdgeInsets.zero,
            fixedSize: const Size(TSizes.buttonWidth, TSizes.buttonHeight),
            backgroundColor: dark ? TColors.primary : TColors.primary),
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
