import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../utils/utils.dart';
import '../controllers/navigatio.controller.dart';
import '../widgets/navigation_destination.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigatioController());

    return Scaffold(
      bottomNavigationBar: Obx(
        () => Container(
          decoration: BoxDecoration(
            border: Border.all(color: TColors.borderPrimary),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(TSizes.borderRadiusXl),
              topLeft: Radius.circular(TSizes.borderRadiusXl),
            ),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(
                top: Radius.circular(TSizes.borderRadiusXl)),
            child: NavigationBar(
              selectedIndex: controller.selectedIndex.value,
              onDestinationSelected: (index) =>
                  controller.selectedIndex.value = index,
              destinations: const [
                // Home Tab
                TNavigationDestination(
                    label: TTexts.homeTab,
                    icon: IconsaxPlusBold.home_2,
                    selectedIcon: IconsaxPlusBold.home_2),

                // Explore Tab
                TNavigationDestination(
                    label: TTexts.exploreTab,
                    icon: IconsaxPlusBold.location,
                    selectedIcon: IconsaxPlusBold.location),

                // Bookmark Tab
                TNavigationDestination(
                    label: TTexts.bookmarkTab,
                    icon: IconsaxPlusBold.bookmark_2,
                    selectedIcon: IconsaxPlusBold.bookmark_2),

                // Chat Tab
                TNavigationDestination(
                    label: TTexts.chatTab,
                    icon: IconsaxPlusBold.message,
                    selectedIcon: IconsaxPlusBold.message),

                // Profile Tab
                TNavigationDestination(
                    label: TTexts.profileTab,
                    icon: IconsaxPlusBold.profile,
                    selectedIcon: IconsaxPlusBold.profile),
              ],
            ),
          ),
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}
