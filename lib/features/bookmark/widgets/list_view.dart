import 'package:flutter/material.dart';

import '../../../utils/utils.dart';
import '../../home/controllers/popular_services_carousel.controllers.dart';
import '../../popular_services/widgets/popular_service_card.dart';

class ListViewPopularServiceCard extends StatelessWidget {
  const ListViewPopularServiceCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = PopularServicesCarouselController.instance;
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.only(
            left: TSizes.defaultSpace,
            right: TSizes.defaultSpace,
            bottom: TSizes.defaultSpace),
        physics: const BouncingScrollPhysics(),
        itemCount: controller.popularServices.length,
        itemBuilder: (context, index) {
          return TPopularServiceCard(item: controller.popularServices[index]);
        },
        separatorBuilder: (context, index) =>
            const SizedBox(height: TSizes.spaceBtwItems),
      ),
    );
  }
}
