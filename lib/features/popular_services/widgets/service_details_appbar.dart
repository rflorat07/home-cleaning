import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../utils/utils.dart';
import '../controllers/service_details.controller.dart';

class ServiceDetailsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ServiceDetailsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = ServiceDetailsController.instance;
    return Obx(() {
      return Container(
        color: controller.appBarColor.value,
        padding: const EdgeInsets.symmetric(horizontal: TSizes.size16),
        child: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: IconButton.filled(
            onPressed: () => Get.back(
              result: controller.isBookmarkChanged.value,
            ),
            iconSize: TSizes.appBarIconSize,
            icon: const Icon(Icons.arrow_back),
            style: IconButton.styleFrom(backgroundColor: TColors.white),
          ),
          actions: [
            IconButton.filled(
              onPressed: () {},
              iconSize: TSizes.appBarIconSize,
              icon: const Icon(Icons.share, color: TColors.dark),
              style: IconButton.styleFrom(backgroundColor: TColors.white),
            ),
            IconButton.filled(
              onPressed: () => controller.addToFavorites(),
              iconSize: TSizes.appBarIconSize,
              style: IconButton.styleFrom(backgroundColor: TColors.white),
              icon: controller.serviceSelected.value.isBookmark
                  ? const Icon(IconsaxPlusBold.heart, color: TColors.green)
                  : const Icon(IconsaxPlusLinear.heart, color: TColors.dark),
            )
          ],
        ),
      );
    });
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
