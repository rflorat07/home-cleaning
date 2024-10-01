import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_cleaning/features/authentication/screens/signup/signup.dart';

import '../../../../../utils/utils.dart';

class TLoginFooter extends StatelessWidget {
  const TLoginFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: TTexts.signUpLabel,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                fontWeight: FontWeight.w500,
              ),
          children: <TextSpan>[
            TextSpan(
              text: TTexts.signUp,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: TColors.green,
                    decoration: TextDecoration.underline,
                    decorationColor: TColors.green,
                    fontWeight: FontWeight.w500,
                  ),
              recognizer: TapGestureRecognizer()
                ..onTap = () => Get.to(() => const SignupScreen()),
            ),
          ]),
    );
  }
}
