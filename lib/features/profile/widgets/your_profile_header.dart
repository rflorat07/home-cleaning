import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../common/common.dart';
import '../../../utils/utils.dart';
import '../controllers/user.controller.dart';

class YourProfileHeader extends StatelessWidget {
  const YourProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Center(
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Obx(
            () {
              final networkImage = controller.user.value.profilePicture;
              final image =
                  networkImage.isNotEmpty ? networkImage : TImages.user;
              return TCircularImage(
                padding: 0,
                width: TSizes.size120,
                height: TSizes.size120,
                image: image,
                isNetworkImage: networkImage.isNotEmpty,
              );
            },
          ),
          Positioned(
            bottom: 0.0,
            right: 0.0,
            child: TCircularIcon(
              width: TSizes.size36,
              height: TSizes.size36,
              size: TSizes.size18,
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
    );
  }
}
