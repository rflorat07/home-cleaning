import 'package:flutter/material.dart';

import '../../../common/common.dart';
import '../../../utils/utils.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: TTexts.privacyPolicy,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
            horizontal: TSizes.defaultSpace, vertical: TSizes.spaceBtwItems),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: TSizes.size12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cancelation Policy',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .apply(color: TColors.green),
                  ),
                  const SizedBox(height: TSizes.size6),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. \n \n Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                    textAlign: TextAlign.justify,
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .apply(color: TColors.darkerGrey),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: TSizes.size12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Terms & Condition',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .apply(color: TColors.green),
                  ),
                  const SizedBox(height: TSizes.size6),
                  ...List.generate(
                    5,
                    (index) => Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. \n \n Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                      textAlign: TextAlign.justify,
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .apply(color: TColors.darkerGrey),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
