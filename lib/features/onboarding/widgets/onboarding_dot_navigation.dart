import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../utils/utils.dart';
import '../controllers/onboarding.controller.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    return Positioned(
      bottom: TDeviceUtils.getBottomNavigationBarHeight() + 25,
      child: SmoothPageIndicator(
        count: 3,
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        effect: ScrollingDotsEffect(
          fixedCenter: false,
          dotWidth: TSizes.dotSize,
          dotHeight: TSizes.dotSize,
          dotColor: TColors.green.withValues(alpha: 0.2),
          activeDotColor: TColors.green,
        ),
      ),
    );
  }
}
