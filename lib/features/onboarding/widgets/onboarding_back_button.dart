import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../utils/utils.dart';
import '../bloc/on_boarding_bloc.dart';

class OnBoardingBackButton extends StatelessWidget {
  const OnBoardingBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return BlocBuilder<OnBoardingBloc, OnBoardingState>(
      buildWhen: (previous, current) =>
          previous.currentPageIndex != current.currentPageIndex,
      builder: (context, state) => state.currentPageIndex == 0
          ? const SizedBox(
              width: TSizes.size64,
              height: TSizes.size48,
            )
          : ElevatedButton(
              onPressed: () =>
                  context.read<OnBoardingBloc>().add(const BackPage()),
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: const CircleBorder(),
                  fixedSize:
                      const Size(TSizes.buttonWidth, TSizes.buttonHeight),
                  backgroundColor: dark ? TColors.white : TColors.white),
              child: const Icon(IconsaxPlusLinear.arrow_left,
                  color: TColors.green),
            ),
    );
  }
}
