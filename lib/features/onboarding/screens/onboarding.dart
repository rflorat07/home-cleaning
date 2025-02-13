import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/utils.dart';
import '../bloc/on_boarding_bloc.dart';
import '../widgets/index.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OnBoardingBloc>(
      create: (context) {
        final pageController = PageController();
        // Para prevenir el error _positions.isNotEmpty
        WidgetsBinding.instance.addPostFrameCallback((_) {
          pageController.animateToPage(0,
              duration: Duration.zero, curve: Curves.linear);
        });
        return OnBoardingBloc(pageController: pageController);
      },
      child: BlocBuilder<OnBoardingBloc, OnBoardingState>(
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  /// Horizontal Scrollable Pages
                  PageView(
                    controller: context.read<OnBoardingBloc>().pageController,
                    onPageChanged: (index) {
                      context
                          .read<OnBoardingBloc>()
                          .add(UpdatePageIndicator(index));
                    },
                    children: const [
                      OnBoardingPage(
                        image: TImages.onBoardingImage1,
                        title: TTexts.onBoardingTitle1,
                        subtitle: TTexts.onBoardingSubTitle1,
                      ),
                      OnBoardingPage(
                        image: TImages.onBoardingImage2,
                        title: TTexts.onBoardingTitle2,
                        subtitle: TTexts.onBoardingSubTitle2,
                      ),
                      OnBoardingPage(
                        image: TImages.onBoardingImage3,
                        title: TTexts.onBoardingTitle3,
                        subtitle: TTexts.onBoardingSubTitle3,
                      ),
                    ],
                  ),

                  /// Skip Button
                  const OnBoardingSkip(),

                  /// Navigation Buttons
                  const OnBoardingNavigation(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
