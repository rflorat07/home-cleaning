import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/utils.dart';
import '../../../controllers/login/login.controller.dart';
import '../../forgot_password/forgot_password.dart';

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
        padding: const EdgeInsets.only(top: TSizes.size54),
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
              controller: controller.email,
              validator: (value) => TValidators.validateEmail(value),
            ),

            const SizedBox(height: TSizes.size20),

            /// Password
            Text(TTexts.password,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontWeight: FontWeight.w500)),

            const SizedBox(height: TSizes.size6),

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

            const SizedBox(height: TSizes.size12),

            /// Remember Me & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Remember Me
                Row(
                  children: [
                    SizedBox(
                      height: TSizes.size24,
                      width: TSizes.size24,
                      child: Obx(
                        () => Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value) => controller.rememberMe.value =
                              !controller.rememberMe.value,
                        ),
                      ),
                    ),
                    const SizedBox(width: TSizes.size4),
                    Text(
                      TTexts.rememberMe,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),

                /// Forget Password
                InkWell(
                  onTap: () => Get.to(() => const ForgotPasswordScreen()),
                  child: Text(
                    TTexts.forgetPassword,
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: TColors.green,
                          fontWeight: FontWeight.w500,
                          decorationColor: TColors.green,
                          decoration: TextDecoration.underline,
                        ),
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
