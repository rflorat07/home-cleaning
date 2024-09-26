import 'package:flutter/material.dart';
import 'package:home_cleaning/common/styles/spacing_styles.dart';
import 'package:home_cleaning/common/widgets/authentication/custom_header.dart';
import 'package:home_cleaning/common/widgets/authentication/form_divider.dart';
import 'package:home_cleaning/common/widgets/authentication/social_buttons.dart';
import 'package:home_cleaning/features/authentication/screens/signup/widgets/signup_footer.dart';
import 'package:home_cleaning/features/authentication/screens/signup/widgets/signup_form.dart';

import '../../../../../utils/utils.dart';

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
