import 'package:flutter/material.dart';

import '../../../../common/common.dart';
import '../../../../utils/utils.dart';
import 'widgets/signup_footer.dart';
import 'widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Title & Sub-Title
              TCustomHeader(
                title: TTexts.signupTitle,
                subTitle: TTexts.signupSubTitle,
              ),

              /// Form
              TSignupForm(),

              /// Divider
              TFormDivider(dividerText: TTexts.orSignUpWith),

              SizedBox(height: TSizes.spaceBtwSections),

              /// Social Buttons
              TSocialButtons(),

              SizedBox(height: TSizes.spaceBtwSections),

              /// Footer
              TSignupFooter()
            ],
          ),
        ),
      ),
    );
  }
}
