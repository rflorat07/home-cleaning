import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/common.dart';
import '../../../utils/utils.dart';
import '../widgets/your_profile_form.dart';
import '../widgets/your_profile_header.dart';

class YourProfileScreen extends StatelessWidget {
  const YourProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(showBackArrow: true, title: TTexts.yourProfile),
      bottomNavigationBar: TBottomNavigationContainer(
          text: TTexts.update, onPressed: () => Get.back()),
      body: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
        child: Column(
          children: [
            // Avatar
            SizedBox(height: TSizes.size16),
            YourProfileHeader(),
            YourProfileForm(),
          ],
        ),
      ),
    );
  }
}
