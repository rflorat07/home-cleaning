import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_cleaning/common/widgets/containers/rounded_container.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../common/models/popular_service.model.dart';
import '../../../common/widgets/icons/t_circular_icon.dart';
import '../../../utils/utils.dart';
import '../../popular_services/controllers/service_details.controller.dart';
import '../controllers/popular_services_carousel.controllers.dart';

class TPopularServicesCarousel extends StatelessWidget {
  const TPopularServicesCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PopularServicesCarouselController());
    final controllerServiceDetails = Get.put(ServiceDetailsController());

    return ConstrainedBox(
      constraints: const BoxConstraints(
          maxHeight: TSizes.carouselPopularServicesMaxHeight),
      child: CarouselView(
        itemSnapping: true,
        onTap: (index) => controllerServiceDetails.serviceDetails =
            controller.popularServices[index],
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        shrinkExtent: THelperFunctions.screenWidth(context) * 0.56,
        itemExtent: THelperFunctions.screenWidth(context) * 0.56,
        backgroundColor: TColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(TSizes.carouselBorderRadius),
        ),
        padding: const EdgeInsets.only(left: TSizes.defaultSpace),
        children: controller.popularServices
            .map((PopularServiceModel item) =>
                UncontainedLayoutPopularService(item: item))
            .toList(),
      ),
    );
  }
}

class UncontainedLayoutPopularService extends StatelessWidget {
  const UncontainedLayoutPopularService({
    super.key,
    this.padding,
    required this.item,
  });

  final PopularServiceModel item;
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
            imageUrl: item.imageUrl,
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
                    vertical: TSizes.xs,
                    horizontal: TSizes.sm,
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: TColors.starYellow,
                        size: TSizes.iconSm,
                      ),
                      const SizedBox(width: TSizes.xs / 2),
                      Text(
                        item.rating,
                        style: textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
                // Bookmark
                const TCircularIcon(
                  size: TSizes.iconSm,
                  height: 29,
                  width: 29,
                  borderRadius: TSizes.borderRadiusLg / 2,
                  padding: EdgeInsets.all(5),
                  icon: AppIcons.bookmark,
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
                    item.money,
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
