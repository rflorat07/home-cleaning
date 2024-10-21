import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                    icon: TIcons.iconHomeTab,
                    selectedIcon: TIcons.iconHomeTabSelected),

                // Explore Tab
                TNavigationDestination(
                    label: TTexts.exploreTab,
                    icon: TIcons.iconExploreTab,
                    selectedIcon: TIcons.iconExploreTabSelected),

                // Bookmark Tab
                TNavigationDestination(
                    label: TTexts.bookmarkTab,
                    icon: TIcons.iconBookmarkTab,
                    selectedIcon: TIcons.iconBookmarkTabSelected),

                // Chat Tab
                TNavigationDestination(
                    label: TTexts.chatTab,
                    icon: TIcons.iconChatTab,
                    selectedIcon: TIcons.iconChatTabSelected),

                // Profile Tab
                TNavigationDestination(
                    label: TTexts.profileTab,
                    icon: TIcons.iconProfileTab,
                    selectedIcon: TIcons.iconProfileTabSelected),
              ],
            ),
          ),
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}
