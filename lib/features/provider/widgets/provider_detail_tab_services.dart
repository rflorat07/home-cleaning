import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/common.dart';
import '../../../utils/utils.dart';
import '../../popular_services/screens/popular_services.dart';
import '../../popular_services/widgets/popular_service_card.dart';
import '../controllers/provider_details.controller.dart';

class ProviderDetailTabServices extends StatelessWidget {
  const ProviderDetailTabServices({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final controller = ProviderDetailsController.instance;

    return Container(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //  Gallery Heading
            TSectionHeading(
              title:
                  '${TTexts.servicesTab} (${controller.servicesDetails.length})',
              textStyle: textTheme.bodyLarge,
              buttonTitle: TTexts.viewAll,
              textButtonStyle: textTheme.bodyLarge!.apply(color: TColors.green),
              onPressed: () => Get.to(() => const PopularServicesScreen()),
            ),

            const SizedBox(height: TSizes.spaceBtwItems),

            // PopularService
            SizedBox(
              height: (TSizes.size135 + 24) * 6,
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.servicesDetails.length > 6
                    ? 6
                    : controller.servicesDetails.length,
                itemBuilder: (context, index) {
                  return TPopularServiceCard(
                    item: controller.servicesDetails[index],
                    onPressed: () {
                      Get.back();
                      controller.removeFromFavorites(
                          controller.servicesDetails[index]);
                    },
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: TSizes.spaceBtwItems),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
