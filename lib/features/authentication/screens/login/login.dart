import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../common/common.dart';
import '../../../../utils/utils.dart';
import 'widgets/login_footer.dart';
import 'widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: TSpacingStyle.paddingWithAppBarHeight,
            child: Column(
              children: [
                /// Title & Sub-Title
                TCustomHeader(
                  title: TTexts.loginTitle,
                  subTitle: TTexts.loginSubTitle,
                ),

                /// Form
                TLoginForm(),

                /// Divider
                TFormDivider(dividerText: TTexts.orSignInWith),

                SizedBox(height: TSizes.spaceBtwSections),

                /// Social Buttons
                TSocialButtons(),

                SizedBox(height: TSizes.spaceBtwSections),

                /// Footer
                TLoginFooter()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
