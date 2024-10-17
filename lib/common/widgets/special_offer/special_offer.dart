import 'package:flutter/material.dart';

import '../../../utils/utils.dart';
import '../../models/special_offer.model.dart';
import '../containers/rounded_container.dart';

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    super.key,
    required this.specialOffer,
    this.height = TSizes.carouselMaxHeight,
  });

  final double height;
  final SpecialOfferModel specialOffer;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: height,
      padding: const EdgeInsets.all(TSizes.carouselPadding),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(specialOffer.imageUrl), fit: BoxFit.cover),
        borderRadius:
            const BorderRadius.all(Radius.circular(TSizes.cardRadiusLg)),
      ),
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
            child: Text(specialOffer.offer,
                style: textTheme.labelSmall, overflow: TextOverflow.ellipsis),
          ),

          const SizedBox(height: TSizes.spaceBtwItems),

          // Special Offer Text
          Text(
            specialOffer.title,
            overflow: TextOverflow.ellipsis,
            style: textTheme.headlineSmall!.apply(color: TColors.white),
          ),

          const SizedBox(height: TSizes.carouselSpaceBtwItems),

          // Up to 40
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  specialOffer.upTo,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.bodyMedium!.apply(color: TColors.white),
                ),
                const SizedBox(width: TSizes.xs),
                Text(
                  specialOffer.discount,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.headlineLarge!.apply(color: TColors.white),
                )
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
                Expanded(
                  child: Text(
                    specialOffer.services,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.labelSmall!.copyWith(
                        fontSize: TSizes.fontSize8, color: TColors.white),
                  ),
                ),

                const SizedBox(width: TSizes.xs),
                //Claim
                TRoundedContainer(
                  radius: 140.0,
                  padding: const EdgeInsets.symmetric(
                      vertical: TSizes.cardRadiusMd / 2,
                      horizontal: TSizes.cardRadiusMd),
                  backgroundColor: TColors.yellow,
                  child: Center(
                    child: Text(specialOffer.cta,
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
