import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/utils.dart';
import '../../../controllers/forgot_password/forgot_password.controller.dart';

class TForgotPasswordForm extends StatelessWidget {
  const TForgotPasswordForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPasswordController());
    return Form(
      key: controller.forgotPasswordFormKey,
      child: Padding(
        padding: const EdgeInsets.only(top: TSizes.size30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Email
            Text(TTexts.email,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontWeight: FontWeight.w500)),

            const SizedBox(height: TSizes.size6),

            TextFormField(
              autofocus: true,
              controller: controller.email,
              validator: (value) => TValidators.validateEmail(value),
            ),

            const SizedBox(height: TSizes.spaceBtwSections),

            /// Submit button
            SizedBox(
              width: double.infinity,
              height: TSizes.buttonHeight,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
                  onPressed: () => controller.sendPasswordResetEmail(),
                  child: const Text(TTexts.submit)),
            ),

            const SizedBox(height: TSizes.spaceBtwItems),
          ],
        ),
      ),
    );
  }
}
