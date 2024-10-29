import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/authentication/custom_header.dart';
import '../../../../data/repositories/authentication/authentication.repository.dart';
import '../../../../utils/utils.dart';
import 'widgets/verify_email_body.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: false,
        actions: [
          IconButton.outlined(
            iconSize: TSizes.appBarIconSize,
            style: OutlinedButton.styleFrom(
                backgroundColor: Colors.transparent,
                side: const BorderSide(color: TColors.borderPrimary)),
            onPressed: () => AuthenticationRepository.instance.logout(),
            icon: const Icon(Icons.close),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: TSizes.defaultSpace,
              vertical: TSizes.spaceBtwSections),
          child: Column(
            children: [
              // Icon
              const Icon(
                IconsaxPlusBold.tick_circle,
                size: TSizes.size120,
                color: TColors.green,
              ),

              /// Title & Sub-Title
              TCustomHeader(
                title: TTexts.verifyCodeTitle,
                subTitle: TTexts.verifyCodeSubTitle,
                info: email ?? '',
              ),

              /// Verify Email Info
              const VerifyEmailBody(),
            ],
          ),
        ),
      ),
    );
  }
}
