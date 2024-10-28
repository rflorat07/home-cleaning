import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/utils.dart';
import '../../../controllers/signup/signup.controller.dart';

class TTermsAndConditionsCheckbox extends StatelessWidget {
  const TTermsAndConditionsCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    return Row(
      children: [
        SizedBox(
          width: TSizes.size24,
          height: TSizes.size24,
          child: Transform.scale(
            scale: 1.2,
            child: Obx(
              () => Checkbox(
                value: controller.privacyPolicy.value,
                onChanged: (value) => controller.privacyPolicy.value =
                    !controller.privacyPolicy.value,
              ),
            ),
          ),
        ),
        const SizedBox(width: TSizes.size8),
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
                recognizer: TapGestureRecognizer()..onTap = () => Get.to(() {}),
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
    );
  }
}
