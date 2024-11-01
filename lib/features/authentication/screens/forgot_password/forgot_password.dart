import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../common/common.dart';
import '../../../../utils/utils.dart';
import 'widgets/forgot_password_form.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        appBar: TAppBar(showBackArrow: true),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
            child: Column(
              children: [
                /// Title & Sub-Title
                TCustomHeader(
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
