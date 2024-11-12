import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../utils/utils.dart';
import '../controllers/onboarding.controller.dart';

class OnBoardingBackButton extends StatelessWidget {
  const OnBoardingBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Obx(() => OnBoardingController.instance.currentPageIndex.value == 0
        ? const SizedBox()
        : Positioned(
            left: double.minPositive,
            bottom: TDeviceUtils.getBottomNavigationBarHeight() + 15,
            child: ElevatedButton(
              onPressed: () => OnBoardingController.instance.backPage(),
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: const CircleBorder(),
                  fixedSize:
                      const Size(TSizes.buttonWidth, TSizes.buttonHeight),
                  backgroundColor: dark ? TColors.white : TColors.white),
              child: const Icon(IconsaxPlusLinear.arrow_left,
                  color: TColors.green),
            ),
          ));
  }
}
