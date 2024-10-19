import 'package:flutter/material.dart';

import '../../../common/common.dart';
import '../../../utils/utils.dart';
import '../widgets/profile_avatar.dart';
import '../widgets/profile_list_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(
        title: TTexts.profileTab,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
        child: Column(
          children: [
            // Avatar - Name
            TProfileAvatar(),
            ProfileListTile()
          ],
        ),
      ),
    );
  }
}
