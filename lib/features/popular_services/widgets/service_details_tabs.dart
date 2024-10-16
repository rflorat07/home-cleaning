import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_cleaning/features/popular_services/widgets/service_details_tab_about.dart';
import 'package:home_cleaning/utils/utils.dart';

import '../controllers/service_details.controller.dart';
import 'service_detail_tab_gallery.dart';
import 'service_detail_tab_review.dart';

class ServiceDetailsTabs extends StatelessWidget {
  const ServiceDetailsTabs({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ServiceDetailsController.instance;

    List<Widget> tabBarView = [
      const ServiceDetailTabAbout(),
      const ServiceDetailTabGallery(),
      const ServiceDetailTabReview(),
    ];
    return Column(
      children: [
        // TAB BAR //
        TabBar(
          onTap: (index) => controller.selectedTabBar.value = index,
          indicatorPadding:
              const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
          tabs: const [
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
