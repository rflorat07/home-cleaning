import 'package:flutter/material.dart';

import '../../../../common/common.dart';
import '../../../../utils/utils.dart';
import 'widgets/signup_footer.dart';
import 'widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Title & Sub-Title
              const TCustomHeader(
                title: TTexts.signupTitle,
                subTitle: TTexts.signupSubTitle,
              ),

              /// Form
              TSignupForm(),

              /// Divider
              const TFormDivider(dividerText: TTexts.orSignUpWith),

              const SizedBox(height: TSizes.spaceBtwSections),

              /// Social Buttons
              const TSocialButtons(),

              const SizedBox(height: TSizes.spaceBtwSections),

              /// Footer
              const TSignupFooter()
            ],
          ),
        ),
      ),
    );
  }
}
