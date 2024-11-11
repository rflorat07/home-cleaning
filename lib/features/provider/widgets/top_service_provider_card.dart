import 'package:flutter/material.dart';

import '../../../common/common.dart';
import '../../../utils/utils.dart';
import '../controllers/top_provider.controllers.dart';

class TopServiceProviderCard extends StatelessWidget {
  const TopServiceProviderCard({
    super.key,
    required this.item,
  });

  final ProviderModel item;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final controller = TopProviderControlller.instance;
    return TRoundedContainer(
      height: 176,
      radius: TSizes.borderRadiusLg,
      backgroundColor: TColors.white,
      showBorder: true,
      padding: const EdgeInsets.all(TSizes.cardPadding),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image Container
                TRoundedContainer(
                  height: 104,
                  width: 90,
                  imageUrl: item.thumbnail,
                  radius: TSizes.borderRadiusMd,
                  backgroundColor: TColors.lightSilver,
                ),

                const SizedBox(width: TSizes.defaultSpace / 2),

                // Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Icon verify - Title
                      TRoundedContainer(
                        backgroundColor: TColors.whiteSmoke,
                        padding: const EdgeInsets.symmetric(
                            vertical: TSizes.xs, horizontal: TSizes.sm),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Icon verify
                            const Icon(
                              AppIcons.verify,
                              color: TColors.green,
                              size: TSizes.iconSm,
                            ),
                            const SizedBox(width: TSizes.xs),

                            // Title
                            Text(
                              item.title,
                              overflow: TextOverflow.ellipsis,
                              style: textTheme.labelLarge!.copyWith(
                                  color: TColors.green,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: TSizes.sm),

                      // Name
                      Text(
                        item.name,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.bodyLarge,
                      ),

                      const SizedBox(height: TSizes.xs),

                      // Service
                      Text(
                        item.category,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.labelLarge!
                            .apply(color: TColors.darkerGrey),
                      ),

                      const SizedBox(height: TSizes.xs),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Wrap(
                            spacing: 3,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              ...List.generate(
                                5,
                                (index) => const Icon(
                                  Icons.star,
                                  size: 14,
                                  color: TColors.starYellow,
                                ),
                              ),
                              Text(
                                '${item.rating}',
                                style: textTheme.bodySmall!
                                    .apply(color: TColors.darkerGrey),
                              ),
                            ],
                          ),

                          // VerticalDivider
                          const SizedBox(
                            height: TSizes.spaceBtwItems,
                            child: VerticalDivider(
                              color: TColors.dividerColor,
                            ),
                          ),

                          // Reviews
                          Text(
                            '${item.reviews.length} Reviews',
                            style: textTheme.labelMedium!.copyWith(
                              color: TColors.darkerGrey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // TextButton
          SizedBox(
            width: double.infinity,
            height: TSizes.buttonMaxHeight,
            child: TextButton(
              onPressed: () => controller.openProviderDetails(item),
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(TSizes.borderRadiusMd),
                  ),
                  backgroundColor: TColors.whiteSmoke),
              child: Text(
                TTexts.viewServices,
                style: textTheme.bodyLarge!.copyWith(
                  color: TColors.primary,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
