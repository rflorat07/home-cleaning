import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_cleaning/features/onboarding/screens/onboarding_back_button.dart';
import 'package:home_cleaning/features/onboarding/screens/onboarding_dot_navigation.dart';
import 'package:home_cleaning/features/onboarding/screens/onboarding_next_button.dart';
import 'package:home_cleaning/features/onboarding/screens/onboarding_skip.dart';
import 'package:home_cleaning/features/onboarding/widgets/onboarding_page.dart';
import 'package:home_cleaning/utils/utils.dart';

import '../controllers/onboarding.controller.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
        child: Stack(
          alignment: Alignment.center,
          children: [
            /// Horizontal Scrollable Pages
            PageView(
              controller: controller.pageController,
              onPageChanged: controller.updatePageIndicator,
              children: const [
                OnBoardingPage(
                  image: TImages.onBoardingImage1,
                  title: TTexts.onBoardingTitle1,
                  subtitle: TTexts.onBoardingSubTitle1,
                ),
                OnBoardingPage(
                  image: TImages.onBoardingImage1,
                  title: TTexts.onBoardingTitle2,
                  subtitle: TTexts.onBoardingSubTitle2,
                ),
                OnBoardingPage(
                  image: TImages.onBoardingImage1,
                  title: TTexts.onBoardingTitle3,
                  subtitle: TTexts.onBoardingSubTitle3,
                ),
              ],
            ),

            /// Skip Button
            const OnBoardingSkip(),

            /// Dot Navigation SmoothPageIndicator
            const OnBoardingDotNavigation(),

            /// Circular Button
            const OnBoardingBackButton(),
            const OnBoardingNextButton(),
          ],
        ),
      ),
    );
  }
}
