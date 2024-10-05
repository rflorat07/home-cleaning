import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_cleaning/common/widgets/containers/rounded_container.dart';
import 'package:home_cleaning/features/home/controllers/special_offer_carousel.controllers.dart';
import 'package:home_cleaning/features/home/models/special_offer.model.dart';

import '../../../utils/utils.dart';

class TSpecialOfferCarousel extends StatelessWidget {
  const TSpecialOfferCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SpecialOfferCarouselController());

    return Obx(() => ConstrainedBox(
          constraints:
              const BoxConstraints(maxHeight: TSizes.carouselMaxHeight),
          child: CarouselView(
            itemSnapping: true,
            shrinkExtent: THelperFunctions.screenWidth(context) * 0.8,
            itemExtent: THelperFunctions.screenWidth(context) * 0.8,
            backgroundColor: TColors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(TSizes.carouselBorderRadius),
            ),
            padding: const EdgeInsets.only(left: TSizes.defaultSpace),
            children: controller.specialOffers
                .map((SpecialOfferModel item) => UncontainedLayoutCard(
                      offer: item.offer,
                      title: item.title,
                      discount: item.discount,
                      imageUrl: item.imageUrl,
                    ))
                .toList(),
          ),
        ));
  }
}

class UncontainedLayoutCard extends StatelessWidget {
  const UncontainedLayoutCard({
    super.key,
    required this.offer,
    required this.title,
    required this.discount,
    required this.imageUrl,
  });

  final String offer, title, discount, imageUrl;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(TSizes.carouselPadding),
      decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.cover)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Limited time!
          TRoundedContainer(
            radius: 50.0,
            backgroundColor: TColors.white,
            padding: const EdgeInsets.symmetric(
              vertical: TSizes.xs,
              horizontal: TSizes.sm,
            ),
            child: Text(offer, style: textTheme.labelSmall),
          ),

          const SizedBox(height: TSizes.spaceBtwItems),

          // Special Offer Text
          Text(
            title,
            style: textTheme.headlineSmall!.apply(color: TColors.white),
          ),

          const SizedBox(height: TSizes.carouselSpaceBtwItems),

          // Up to 40
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Up to',
                  style: textTheme.bodyMedium!.apply(color: TColors.white),
                ),
                const SizedBox(width: TSizes.xs),
                Text(
                  discount,
                  style: textTheme.headlineLarge!.apply(color: TColors.white),
                ),
              ],
            ),
          ),

          // All Services Available - Claim
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // All Services Available
              children: [
                Text(
                  'All Services Available | T&C Applied',
                  style: textTheme.labelSmall!.copyWith(
                      fontSize: TSizes.fontSizeXs, color: TColors.white),
                ),

                //Claim
                TRoundedContainer(
                  radius: 140.0,
                  padding: const EdgeInsets.symmetric(
                      vertical: TSizes.cardRadiusMd / 2,
                      horizontal: TSizes.cardRadiusMd),
                  backgroundColor: TColors.yellow,
                  child: Center(
                    child: Text('Claim',
                        style: textTheme.labelLarge!
                            .copyWith(fontWeight: FontWeight.w600)),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
