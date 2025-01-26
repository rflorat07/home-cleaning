import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/common.dart';
import '../../../utils/utils.dart';
import '../controllers/service_details.controller.dart';

class ServiceDetailsHeader extends StatelessWidget {
  const ServiceDetailsHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = ServiceDetailsController.instance;
    final serviceSelected = controller.serviceSelected;
    return Obx(
      () => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        height: TDeviceUtils.getScreenHeight(context) * 0.4,
        decoration: BoxDecoration(
          color: TColors.lightSilver,
          image: controller.isLoading.value
              ? null
              : DecorationImage(
                  image: CachedNetworkImageProvider(
                    serviceSelected.value.thumbnail,
                  ),
                  fit: BoxFit.cover),
        ),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            // Button Demo Video
            FilledButton(
              onPressed: () {},
              style: FilledButton.styleFrom(
                maximumSize: const Size(TSizes.size160, TSizes.size48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(TSizes.buttonRadius),
                ),
                padding: const EdgeInsets.symmetric(
                    vertical: TSizes.spaceBtwItems / 2,
                    horizontal: TSizes.spaceBtwItems),
                backgroundColor: TColors.davyGrey.withValues(alpha: 0.5),
              ),
              child: Row(
                children: [
                  TRoundedContainer(
                    width: TSizes.spaceBtwSections,
                    height: TSizes.spaceBtwSections,
                    child: Icon(
                      Icons.play_arrow_rounded,
                      color: TColors.davyGrey.withValues(alpha: 0.5),
                    ),
                  ),
                  const SizedBox(width: TSizes.sm),
                  Text(
                    TTexts.demoVideo,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: TColors.white, fontSize: TSizes.fontSize15),
                  )
                ],
              ),
            ),

            // Image List
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: TRoundedContainer(
                  height: TSizes.size57,
                  radius: TSizes.size8,
                  backgroundColor: TColors.white,
                  padding: const EdgeInsets.all(TSizes.xs),
                  child: Wrap(
                    spacing: TSizes.xs,
                    children: [
                      ...List.generate(
                        serviceSelected.value.images.length > 5
                            ? 5
                            : serviceSelected.value.images.length,
                        (index) => TRoundedContainer(
                          width: TSizes.size49,
                          height: TSizes.size49,
                          radius: TSizes.cardRadiusXs,
                          imageUrl: serviceSelected.value.images[index],
                          backgroundColor: TColors.lightSilver,
                          onTap: () {
                            Get.to(
                              () => GalleryPhotoViewWrapper(
                                initialIndex: index,
                                galleryItems: serviceSelected.value.images,
                              ),
                            );
                          },
                        ),
                      ),
                      if (serviceSelected.value.images.length > 5)
                        TRoundedContainer(
                          width: TSizes.size49,
                          height: TSizes.size49,
                          radius: TSizes.cardRadiusXs,
                          imageUrl: serviceSelected.value.images[6],
                          backgroundColor:
                              TColors.darkerGrey.withValues(alpha: 0.6),
                          child: Container(
                            color: Colors.black.withValues(alpha: 0.4),
                            child: Center(
                              child: Text(
                                '+ ${serviceSelected.value.images.length - 5}',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(
                                        color: TColors.white,
                                        fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
