import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../utils/utils.dart';
import '../bloc/on_boarding_bloc.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingBloc, OnBoardingState>(
      buildWhen: (previous, current) =>
          previous.currentPageIndex != current.currentPageIndex,
      builder: (context, state) {
        return SmoothPageIndicator(
          count: 3,
          controller: context.read<OnBoardingBloc>().pageController,
          onDotClicked: (index) =>
              context.read<OnBoardingBloc>().add(DotNavigationClick(index)),
          effect: ScrollingDotsEffect(
            fixedCenter: false,
            dotWidth: TSizes.dotSize,
            dotHeight: TSizes.dotSize,
            dotColor: TColors.green.withValues(alpha: 0.2),
            activeDotColor: TColors.green,
          ),
        );
      },
    );
  }
}
