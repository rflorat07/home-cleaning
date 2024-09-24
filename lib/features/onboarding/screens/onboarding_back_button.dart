import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';
import '../controllers/onboarding.controller.dart';

class OnBoardingBackButton extends StatelessWidget {
  const OnBoardingBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Obx(() => OnBoardingController.instance.currentPageIndex == 0
        ? const SizedBox()
        : Positioned(
            left: 0.0,
            bottom: TDeviceUtils.getBottomNavigationBarHeight() + 15,
            child: ElevatedButton(
              onPressed: () => OnBoardingController.instance.backPage(),
              style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  fixedSize:
                      const Size(TSizes.buttonWidth, TSizes.buttonHeight),
                  backgroundColor: dark ? TColors.white : TColors.white),
              child: const Icon(
                Icons.arrow_back,
                color: TColors.green,
              ),
            ),
          ));
  }
}
