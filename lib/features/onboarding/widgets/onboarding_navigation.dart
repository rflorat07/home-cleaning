import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/utils.dart';
import '../../authentication/screens/login/login.dart';
import '../bloc/on_boarding_bloc.dart';
import 'index.dart';

class OnBoardingNavigation extends StatelessWidget {
  const OnBoardingNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<OnBoardingBloc, OnBoardingState>(
      listener: (context, state) {
        if (state.status == OnBoardingStatus.loaded) {
          AppNavigator.pushAndRemove(context, const LoginScreen());
        }
      },
      child: Positioned(
        left: 0,
        right: 0,
        bottom: TDeviceUtils.getBottomNavigationBarHeight() + 25,
        child: const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// OnBoarding Back Button
            OnBoardingBackButton(),

            /// Dot Navigation SmoothPageIndicator
            OnBoardingDotNavigation(),

            /// OnBoarding Next Button
            OnBoardingNextButton(),
          ],
        ),
      ),
    );
  }
}
