import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../common/common.dart';
import '../../../utils/utils.dart';
import 'service_review.dart';

class ServiceDetailTabReview extends StatelessWidget {
  const ServiceDetailTabReview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //  Gallery Heading
          TSectionHeading(
            title: TTexts.reviewTab,
            textStyle: textTheme.bodyLarge,
            buttonTitle: TTexts.addReview,
            icon: const Icon(
              IconsaxPlusLinear.edit_2,
              size: TSizes.size18,
              color: TColors.green,
            ),
            textButtonStyle: textTheme.bodyLarge!.apply(color: TColors.green),
          ),

          const SizedBox(height: TSizes.spaceBtwItems),

          // Search in reviews
          TRoundedContainer(
            showBorder: true,
            radius: TSizes.size12,
            height: TSizes.size40,
            padding: const EdgeInsets.symmetric(horizontal: TSizes.size12),
            child: Row(
              children: [
                const Icon(
                  IconsaxPlusLinear.search_normal_1,
                  color: TColors.green,
                ),
                const SizedBox(width: TSizes.size12),
                Text(
                  TTexts.searchReviews,
                  style: textTheme.bodyMedium!.apply(color: TColors.darkerGrey),
                )
              ],
            ),
          ),

          // Reviews
          const ServiceReview(),
        ],
      ),
    );
  }
}
