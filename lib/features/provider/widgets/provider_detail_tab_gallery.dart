import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/common.dart';
import '../../../utils/utils.dart';
import '../controllers/provider_details.controller.dart';

class ProviderDetailTabGallery extends StatelessWidget {
  const ProviderDetailTabGallery({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final controller = ProviderDetailsController.instance;
    return Container(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //  Gallery Heading
          TSectionHeading(
            title:
                '${TTexts.galleryTab}(${controller.providerDetails.value.images.length})',
            textStyle: textTheme.bodyLarge,
            buttonTitle: TTexts.viewAll,
            textButtonStyle: textTheme.bodyLarge!.apply(color: TColors.green),
            onPressed: () {
              Get.to(
                () => GalleryPhotoViewWrapper(
                  galleryItems: controller.providerDetails.value.images,
                ),
              );
            },
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
                  controller.providerDetails.value.images.length > 6
                      ? 6
                      : controller.providerDetails.value.images.length,
                  (index) => TRoundedContainer(
                    radius: TSizes.size6,
                    imageUrl: controller.providerDetails.value.images[index],
                    backgroundColor: TColors.lightSilver,
                    onTap: () {
                      Get.to(
                        () => GalleryPhotoViewWrapper(
                          initialIndex: index,
                          galleryItems: controller.providerDetails.value.images,
                        ),
                      );
                    },
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
