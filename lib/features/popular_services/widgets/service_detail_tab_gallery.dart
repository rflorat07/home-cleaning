import 'package:flutter/material.dart';

import '../../../common/common.dart';
import '../../../utils/utils.dart';
import '../controllers/service_details.controller.dart';

class ServiceDetailTabGallery extends StatelessWidget {
  const ServiceDetailTabGallery({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final controller = ServiceDetailsController.instance;
    return Container(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //  Gallery Heading
          TSectionHeading(
            title:
                '${TTexts.galleryTab}(${controller.serviceSelected.value.images.length})',
            textStyle: textTheme.bodyLarge,
            buttonTitle: TTexts.viewAll,
            textButtonStyle: textTheme.bodyLarge!.apply(color: TColors.green),
          ),

          const SizedBox(height: TSizes.spaceBtwItems),

          // Gallery IMG
          SizedBox(
            height: ((MediaQuery.of(context).size.width - 40) / 2) * 3,
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(0.0),
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: TSizes.size8,
              mainAxisSpacing: TSizes.size8,
              crossAxisCount: 2,
              children: [
                ...List.generate(
                  controller.serviceSelected.value.images.length > 6
                      ? 6
                      : controller.serviceSelected.value.images.length,
                  (index) => TRoundedContainer(
                    radius: TSizes.size6,
                    imageUrl: controller.serviceSelected.value.images[index],
                    backgroundColor: TColors.lightSilver,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
