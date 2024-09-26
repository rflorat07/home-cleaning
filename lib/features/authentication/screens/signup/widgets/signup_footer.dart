import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/utils.dart';

class TSignupFooter extends StatelessWidget {
  const TSignupFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: TTexts.signInpLabel,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                fontWeight: FontWeight.w500,
              ),
          children: <TextSpan>[
            TextSpan(
              text: TTexts.signIn,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: TColors.green,
                    decoration: TextDecoration.underline,
                    decorationColor: TColors.green,
                    fontWeight: FontWeight.w500,
                  ),
              recognizer: TapGestureRecognizer()..onTap = () => Get.to(() {}),
            ),
          ]),
    );
  }
}
