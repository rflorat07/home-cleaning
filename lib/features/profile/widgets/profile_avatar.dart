import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../common/common.dart';
import '../../../utils/utils.dart';
import '../controllers/user.controller.dart';

class TProfileAvatar extends StatelessWidget {
  const TProfileAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return Center(
      child: Column(
        children: [
          // Avatar
          Stack(
            children: [
              Obx(
                () {
                  final networkImage = controller.user.value.profilePicture;
                  final image =
                      networkImage.isNotEmpty ? networkImage : TImages.user;
                  return TCircularImage(
                    padding: 0,
                    width: TSizes.size100,
                    height: TSizes.size100,
                    image: image,
                    isNetworkImage: networkImage.isNotEmpty,
                  );
                },
              ),
              Positioned(
                bottom: 0.0,
                right: 0.0,
                child: TCircularIcon(
                  width: TSizes.iconXL,
                  height: TSizes.iconXL,
                  size: TSizes.iconSl,
                  showBorder: true,
                  borderWidth: 2.0,
                  borderColor: TColors.white,
                  backgroundColor: TColors.primary,
                  icon: IconsaxPlusLinear.edit_2,
                  iconColor: TColors.white,
                  onPressed: () => controller.uploadUserProfilePicture(),
                ),
              ),
            ],
          ),

          const SizedBox(height: TSizes.spaceBtwItems),

          // Name
          Obx(
            () => Text(
              controller.user.value.fullName,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
