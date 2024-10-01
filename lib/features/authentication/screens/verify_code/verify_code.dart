import 'package:flutter/material.dart';
import 'package:home_cleaning/common/widgets/appbar/appbar.dart';
import 'package:home_cleaning/common/widgets/authentication/custom_header.dart';
import 'package:home_cleaning/features/authentication/screens/verify_code/widgets/verify_code_form.dart';

import '../../../../utils/utils.dart';

class VerifyCodeScreen extends StatelessWidget {
  const VerifyCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: TSizes.defaultSpace,
              vertical: TSizes.spaceBtwSections),
          child: Column(
            children: [
              /// Title & Sub-Title
              TCustomHeader(
                title: TTexts.verifyCodeTitle,
                subTitle: TTexts.verifyCodeSubTitle,
                info: 'example@email.com',
              ),

              /// Form
              VerifyCodeForm(),
            ],
          ),
        ),
      ),
    );
  }
}
