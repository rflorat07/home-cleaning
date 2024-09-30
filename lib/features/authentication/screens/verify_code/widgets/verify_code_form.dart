import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_cleaning/features/authentication/controllers/verify_code/verify_code.dart';
import 'package:home_cleaning/features/authentication/screens/login/login.dart';
import 'package:home_cleaning/utils/utils.dart';

class VerifyCodeForm extends StatelessWidget {
  const VerifyCodeForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyCodeController());
    return Form(
      key: controller.verifyCodeFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: TSizes.spaceBtwSections,
        ),
        child: Column(
          children: [
            // Input code
            Wrap(
              spacing: TSizes.defaultSpace / 2,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: List.generate(4, (index) {
                return SizedBox(
                  width: TSizes.inputMinWidth,
                  height: TSizes.inputMaxHeight,
                  child: TextFormField(
                    maxLength: 1,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      counterText: "",
                    ),
                  ),
                );
              }),
            ),

            const SizedBox(height: TSizes.spaceBtwSections),

            // Didn’t receive OTP?
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
              onPressed: () => (),
              child: Text(
                TTexts.resendCode,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline),
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwSections),

            /// Verify button
            SizedBox(
              width: double.infinity,
              height: TSizes.buttonHeight,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
                  onPressed: () => Get.to(() => const LoginScreen()),
                  child: const Text(TTexts.verify)),
            ),
          ],
        ),
      ),
    );
  }
}
