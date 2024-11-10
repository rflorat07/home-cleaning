import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../common/common.dart';
import '../../../utils/utils.dart';
import '../controllers/popular_services_carousel.controllers.dart';

class TPopularServicesCarousel extends StatelessWidget {
  const TPopularServicesCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PopularServicesCarouselController());
    return Obx(
      () {
        if (controller.isLoading.value) {
          return TCarouselView(
              widthFactor: 0.56,
              maxHeight: TSizes.carouselPopularServicesMaxHeight,
              children: [
                TShimmerEffect(
                    width: THelperFunctions.screenWidth(context) * 0.56,
                    height: TSizes.carouselPopularServicesMaxHeight),
                TShimmerEffect(
                    width: THelperFunctions.screenWidth(context) * 0.56,
                    height: TSizes.carouselPopularServicesMaxHeight)
              ]);
        }

        return TCarouselView(
          widthFactor: 0.56,
          maxHeight: TSizes.carouselPopularServicesMaxHeight,
          onTap: (index) =>
              controller.openServiceDetails(controller.popularServices[index]),
          children: controller.popularServices
              .map((ServiceModel item) =>
                  UncontainedLayoutPopularService(item: item))
              .toList(),
        );
      },
    );
  }
}

class UncontainedLayoutPopularService extends StatelessWidget {
  const UncontainedLayoutPopularService({
    super.key,
    this.padding,
    required this.item,
  });

  final ServiceModel item;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Container
          TRoundedContainer(
            radius: TSizes.borderRadiusLg,
            height: 133,
            backgroundColor: TColors.lightSilver,
            padding: const EdgeInsets.all(TSizes.defaultSpace / 2),
            //width: THelperFunctions.screenWidth(context) * 0.56,
            imageUrl: item.thumbnail,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Rating
                TRoundedContainer(
                  height: 29,
                  radius: TSizes.borderRadiusLg / 2,
                  backgroundColor: TColors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: TSizes.size4,
                    horizontal: TSizes.size8,
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: TColors.starYellow,
                        size: TSizes.iconSm,
                      ),
                      const SizedBox(width: TSizes.size2),
                      Text(
                        item.rating.toString(),
                        style: textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
                // Bookmark
                TCircularIcon(
                  size: TSizes.iconSm,
                  height: 29,
                  width: 29,
                  borderRadius: TSizes.borderRadiusLg / 2,
                  padding: const EdgeInsets.all(5),
                  icon: item.isBookmark
                      ? AppIcons.bookmark
                      : AppIcons.linearBookmark,
                  iconColor: TColors.green,
                ),
              ],
            ),
          ),

          const SizedBox(height: TSizes.spaceBtwItems / 2),

          // Title - Icon - Name - Cost
          InkWell(
            onTap: () {},
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    item.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.bodyLarge!.copyWith(fontSize: 15),
                  ),

                  const SizedBox(height: TSizes.xs),
                  // Icon - Name
                  Row(
                    children: [
                      const Icon(IconsaxPlusBold.profile,
                          color: TColors.green, size: 20),
                      const SizedBox(height: TSizes.xs / 2),
                      Text(
                        item.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.labelLarge!
                            .apply(color: TColors.darkerGrey),
                      )
                    ],
                  ),

                  const SizedBox(height: TSizes.xs),

                  // Cost
                  Text(
                    item.price.toString(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.bodyLarge!.apply(color: TColors.green),
                  )
                ],
              ),
            ),
          )
          // Title
        ],
      ),
    );
  }
}
