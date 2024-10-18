import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';
import '../../popular_services/controllers/service_details.controller.dart';
import '../../popular_services/widgets/service_detail_tab_gallery.dart';
import '../../popular_services/widgets/service_detail_tab_review.dart';
import '../../popular_services/widgets/service_details_tab_about.dart';
import 'service_provider_detail_tab_services.dart';

class ServiceProviderDetailsTabs extends StatelessWidget {
  const ServiceProviderDetailsTabs({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ServiceDetailsController.instance;

    List<Widget> tabBarView = [
      const ServiceProviderDetailTabServices(),
      const ServiceDetailTabAbout(),
      const ServiceDetailTabGallery(),
      const ServiceDetailTabReview(),
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
