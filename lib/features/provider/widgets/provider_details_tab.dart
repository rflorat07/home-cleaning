import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';
import '../controllers/provider_details.controller.dart';
import 'provider_detail_tab_gallery.dart';
import 'provider_detail_tab_review.dart';
import 'provider_detail_tab_services.dart';
import 'provider_details_tab_about.dart';

class ProviderDetailsTabs extends StatelessWidget {
  const ProviderDetailsTabs({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ProviderDetailsController.instance;

    List<Widget> tabBarView = [
      const ProviderDetailTabServices(),
      const ProviderDetailTabAbout(),
      const ProviderDetailTabGallery(),
      const ProviderDetailTabReview(),
    ];
    return Column(
      children: [
        // TAB BAR //
        TabBar(
          onTap: (index) => controller.selectedTabBar.value = index,
          tabs: const [
            Tab(child: Text(TTexts.servicesTab)),
            Tab(child: Text(TTexts.aboutTab)),
            Tab(child: Text(TTexts.galleryTab)),
            Tab(child: Text(TTexts.reviewTab)),
          ],
        ),

        Builder(
          builder: (_) =>
              Obx(() => tabBarView[controller.selectedTabBar.value]),
        ),
      ],
    );
  }
}
