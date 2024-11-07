import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/carousel/carousel_view.dart';
import '../../../utils/constants/sizes.dart';
import '../../home/controllers/popular_services_carousel.controllers.dart';
import '../../home/widgets/popular_services_carousel.dart';

class ExplorerCarouselCard extends StatelessWidget {
  const ExplorerCarouselCard({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PopularServicesCarouselController.instance;
    return Column(
      children: [
        Obx(
          () => TCarouselView(
            widthFactor: 0.65,
            maxHeight: 240,
            showBorderSide: true,
            onTap: (index) => controller
                .openServiceDetails(controller.popularServices[index]),
            children: List<Widget>.generate(controller.popularServices.length,
                (int index) {
              return UncontainedLayoutPopularService(
                  item: controller.popularServices[index],
                  padding: const EdgeInsets.all(12));
            }),
          ),
        ),
        const SizedBox(height: TSizes.defaultSpace)
      ],
    );
  }
}
