import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/common.dart';
import '../../../utils/utils.dart';
import '../../home/controllers/popular_services_carousel.controllers.dart';
import '../../popular_services/screens/popular_services.dart';
import '../../popular_services/widgets/popular_service_card.dart';

class ServiceProviderDetailTabServices extends StatelessWidget {
  const ServiceProviderDetailTabServices({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final controller = PopularServicesCarouselController.instance;

    return Container(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //  Gallery Heading
          TSectionHeading(
            title:
                '${TTexts.servicesTab} (${controller.popularServices.length})',
            textStyle: textTheme.bodyLarge,
            buttonTitle: TTexts.viewAll,
            textButtonStyle: textTheme.bodyLarge!.apply(color: TColors.green),
            onPressed: () => Get.to(() => const PopularServicesScreen()),
          ),

          const SizedBox(height: TSizes.spaceBtwItems),

          // Gallery IMG
          SizedBox(
            height: (TSizes.size135 + 24) * 6,
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 6,
              itemBuilder: (context, index) {
                return TPopularServiceCard(
                    item: controller.popularServices[index]);
              },
              separatorBuilder: (context, index) =>
                  const SizedBox(height: TSizes.spaceBtwItems),
            ),
          ),
        ],
      ),
    );
  }
}
