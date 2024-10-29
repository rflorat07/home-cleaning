import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../data/repositories/authentication/authentication.repository.dart';
import '../../../routes/routes.dart';
import '../../../utils/utils.dart';
import '../controllers/profile.controller.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Column(
      children: [
        const SizedBox(height: TSizes.spaceBtwItems),
        ...List.generate(
          controller.profileListTile.length,
          (index) => ListTile(
            onTap: () {
              if (controller.profileListTile[index].router == TRoutes.logout) {
                AuthenticationRepository.instance.logout();
              } else {
                Get.toNamed(controller.profileListTile[index].router);
              }
            },
            title: Text(controller.profileListTile[index].title),
            leading: Icon(controller.profileListTile[index].icon),
            trailing: const Icon(IconsaxPlusLinear.arrow_right_3),
          ),
        ),
        const SizedBox(height: TSizes.defaultSpace),
      ],
    );
  }
}
