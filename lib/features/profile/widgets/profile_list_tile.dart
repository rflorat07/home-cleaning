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
                _showLogoutBottomSheet(context);
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

  void _showLogoutBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      enableDrag: false,
      isDismissible: false,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(TSizes.size16)),
      builder: (BuildContext context) {
        final textTheme = Theme.of(context).textTheme;
        return SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: TSizes.defaultSpace,
                vertical: TSizes.size16,
              ),
              width: double.infinity,
              child: Column(
                children: [
                  // Logout text
                  Text(
                    TTexts.logout,
                    style: textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  // Divider
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const Divider(),
                  const SizedBox(height: TSizes.size12),

                  // Are you sure you want to log out?
                  Text(
                    TTexts.logoutMessage,
                    style:
                        textTheme.titleSmall!.apply(color: TColors.darkerGrey),
                  ),

                  const SizedBox(height: TSizes.defaultSpace),
                  // Button - Cancel - Remove
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // CTA Cancel
                      Expanded(
                        child: SizedBox(
                          height: TSizes.size48,
                          child: FilledButton(
                            onPressed: Get.back,
                            style: const ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(TColors.whiteSmoke),
                            ),
                            child: const Text(
                              TTexts.cancel,
                              style: TextStyle(color: TColors.green),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: TSizes.size10),

                      // CTA Yes, Logout
                      Expanded(
                        child: SizedBox(
                          height: TSizes.size48,
                          child: FilledButton(
                            onPressed: () =>
                                AuthenticationRepository.instance.logout(),
                            child: const Text(TTexts.yesLogout),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
