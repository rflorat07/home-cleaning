import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/utils.dart';
import '../../../controllers/signup/signup.controller.dart';
import '../../verify_code/verify_code.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Name
            Text(TTexts.name,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontWeight: FontWeight.w500)),

            const SizedBox(height: TSizes.spaceBtwInputFields / 2),

            TextFormField(
              controller: controller.email,
              validator: (value) => TValidators.validateEmail(value),
            ),

            const SizedBox(height: TSizes.spaceBtwInputFields),

            /// Email
            Text(TTexts.email,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontWeight: FontWeight.w500)),

            const SizedBox(height: TSizes.spaceBtwInputFields / 2),

            TextFormField(
              controller: controller.email,
              validator: (value) => TValidators.validateEmail(value),
            ),

            const SizedBox(height: TSizes.spaceBtwInputFields),

            /// Password
            Text(TTexts.password,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontWeight: FontWeight.w500)),

            const SizedBox(height: TSizes.spaceBtwInputFields / 2),

            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) => TValidators.validatePassword(value),
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                  onPressed: () => controller.hidePassword.value =
                      !controller.hidePassword.value,
                  icon: Icon(
                    controller.hidePassword.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                )),
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwInputFields / 2),

            /// Agree with Terms & Condition
            Row(
              children: [
                SizedBox(
                  width: TSizes.lg,
                  height: TSizes.lg,
                  child: Transform.scale(
                    scale: 1.2,
                    child: Checkbox(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                ),
                const SizedBox(width: TSizes.sm),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: TTexts.agree,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                      TextSpan(
                        text: TTexts.termsCondition,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.to(() {}),
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w500,
                              color: TColors.green,
                              decoration: TextDecoration.underline,
                              decorationColor: TColors.green,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// Sign In button
            SizedBox(
              width: double.infinity,
              height: TSizes.buttonHeight,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
                  onPressed: () => Get.to(() => const VerifyCodeScreen()),
                  child: const Text(TTexts.signUp)),
            ),

            const SizedBox(height: TSizes.spaceBtwItems),
          ],
        ),
      ),
    );
  }
}
