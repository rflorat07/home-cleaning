import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/utils.dart';
import '../../../controllers/verify_email/verify_email.controller.dart';

class VerifyEmailBody extends StatelessWidget {
  const VerifyEmailBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Column(
      children: [
        const SizedBox(height: TSizes.spaceBtwItems),

        // Send email info
        Text(
          TTexts.sendEmailInfo,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .apply(color: TColors.darkerGrey),
        ),

        const SizedBox(height: TSizes.spaceBtwSections),

        /// Verify button
        SizedBox(
          width: double.infinity,
          height: TSizes.buttonHeight,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
              onPressed: () => controller.checkEmailVerificationStatus,
              child: const Text(TTexts.ctaContinue)),
        ),

        const SizedBox(height: TSizes.spaceBtwSections),

        Text(
          TTexts.receiveOtp,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .apply(color: TColors.darkerGrey),
        ),

        // Resend code
        TextButton(
          onPressed: () => controller.sendEmailVerification,
          child: Text(
            TTexts.resendEmail,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline),
          ),
        ),
      ],
    );
  }
}
