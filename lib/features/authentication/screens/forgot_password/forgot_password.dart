import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../common/common.dart';
import '../../../../utils/utils.dart';
import 'widgets/forgot_password_form.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        appBar: const TAppBar(showBackArrow: true),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
            child: Column(
              children: [
                /// Title & Sub-Title
                const TCustomHeader(
                  title: TTexts.forgotPasswordTitle,
                  subTitle: TTexts.forgotPasswordSubTitle,
                  //padding: EdgeInsets.only(top: TSizes.size120),
                ),

                /// Form
                TForgotPasswordForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
