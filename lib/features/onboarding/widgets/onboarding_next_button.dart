import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/utils.dart';
import '../bloc/on_boarding_bloc.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return BlocBuilder<OnBoardingBloc, OnBoardingState>(
      buildWhen: (previous, current) =>
          previous.currentPageIndex != current.currentPageIndex,
      builder: (context, state) {
        return ElevatedButton(
          onPressed: () => context.read<OnBoardingBloc>().add(const NextPage()),
          style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: EdgeInsets.zero,
              fixedSize: const Size(TSizes.buttonWidth, TSizes.buttonHeight),
              backgroundColor: dark ? TColors.primary : TColors.primary),
          child: const Icon(Icons.arrow_forward, color: TColors.white),
        );
      },
    );
  }
}
