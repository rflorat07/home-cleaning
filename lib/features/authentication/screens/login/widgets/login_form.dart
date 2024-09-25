import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/utils.dart';
import '../../../controllers/login/login.controller.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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

            /// Remember Me & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                /// Forget Password
                TextButton(
                  onPressed: () => Get.to(() => null),
                  style: TextButton.styleFrom(
                    foregroundColor: TColors.green,
                    textStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                        decorationColor: TColors.green,
                        backgroundColor: Colors.transparent),
                  ),
                  child: const Text(TTexts.forgetPassword),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// Sign In button
            SizedBox(
              width: double.infinity,
              height: TSizes.buttonHeight,
              child: ElevatedButton(
                  onPressed: () => controller.emailAndPasswordSignIn(),
                  child: const Text(TTexts.signIn)),
            ),

            const SizedBox(height: TSizes.spaceBtwItems),
          ],
        ),
      ),
    );
  }
}
