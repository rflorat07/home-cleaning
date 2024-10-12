import 'package:flutter/material.dart';
import 'package:home_cleaning/common/widgets/appbar/appbar.dart';

import '../../../utils/utils.dart';
import '../widgets/profile_avatar.dart';
import '../widgets/profile_list_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(TTexts.profileTab,
            style: Theme.of(context).textTheme.titleMedium),
      ),
      body: const SingleChildScrollView(
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
