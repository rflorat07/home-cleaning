import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../utils/utils.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    this.icon,
    required this.title,
    required this.subTitle,
    required this.onPressed,
  });

  final IconData? icon;
  final String title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// Image
              Icon(
                icon ?? IconsaxPlusBold.tick_circle,
                size: TSizes.size126,
                color: TColors.green,
              ),
              const SizedBox(height: TSizes.size12),

              /// Title & SubTitle
              Text(title,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(subTitle,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(color: TColors.darkerGrey),
                  textAlign: TextAlign.center),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: const Text(TTexts.ctaContinue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
