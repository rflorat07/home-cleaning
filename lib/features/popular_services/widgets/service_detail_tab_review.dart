import 'package:flutter/material.dart';
import 'package:home_cleaning/common/widgets/containers/rounded_container.dart';
import 'package:home_cleaning/common/widgets/texts/section_heading.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../utils/utils.dart';

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
          Container(
            margin: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Avatar - Name - Months
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Avatar - Name
                    Row(
                      children: [
                        // Avatar
                        const CircleAvatar(
                          radius: TSizes.size18,
                          backgroundColor: TColors.lightSilver,
                        ),
                        const SizedBox(width: TSizes.size8),

                        // Name
                        Text('Dale Thiel', style: textTheme.bodyLarge),
                      ],
                    ),
                    // Months
                    Text(
                      '11 months ago',
                      style: textTheme.labelLarge!
                          .apply(color: TColors.darkerGrey),
                    )
                  ],
                ),

                const SizedBox(height: TSizes.size12),
                // Text
                Text(
                  TTexts.loremIpsum,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.labelLarge!.apply(color: TColors.darkerGrey),
                ),

                const SizedBox(height: TSizes.size8),

                // star
                Wrap(
                  spacing: 3,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    ...List.generate(
                      5,
                      (index) => const Icon(
                        Icons.star,
                        size: TSizes.size18,
                        color: TColors.starYellow,
                      ),
                    ),
                    Text(
                      '5.0',
                      style: textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const Divider(color: TColors.dividerColor),

          // Reviews
          Container(
            margin: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Avatar - Name - Months
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Avatar - Name
                    Row(
                      children: [
                        // Avatar
                        const CircleAvatar(
                          radius: TSizes.size18,
                          backgroundColor: TColors.lightSilver,
                        ),
                        const SizedBox(width: TSizes.size8),

                        // Name
                        Text('Tiffany Nitzsche', style: textTheme.bodyLarge),
                      ],
                    ),
                    // Months
                    Text(
                      '11 months ago',
                      style: textTheme.labelLarge!
                          .apply(color: TColors.darkerGrey),
                    )
                  ],
                ),

                const SizedBox(height: TSizes.size12),
                // Text
                Text(
                  TTexts.loremIpsum,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.labelLarge!.apply(color: TColors.darkerGrey),
                ),

                const SizedBox(height: TSizes.size8),

                // star
                Wrap(
                  spacing: 3,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    ...List.generate(
                      5,
                      (index) => const Icon(
                        Icons.star,
                        size: TSizes.size18,
                        color: TColors.starYellow,
                      ),
                    ),
                    Text(
                      '5.0',
                      style: textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Gallery IMG
          Expanded(
            child: GridView.count(
              primary: false,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(0.0),
              crossAxisSpacing: TSizes.size8,
              mainAxisSpacing: TSizes.size8,
              crossAxisCount: 2,
              children: [
                ...List.generate(
                  4,
                  (_) => const TRoundedContainer(
                    radius: TSizes.size6,
                    backgroundColor: TColors.lightSilver,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
