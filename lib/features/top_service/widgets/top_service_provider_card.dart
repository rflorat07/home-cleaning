import 'package:flutter/material.dart';

import '../../../common/models/top_service.model.dart';
import '../../../common/widgets/containers/rounded_container.dart';
import '../../../utils/utils.dart';

class TopServiceProviderCard extends StatelessWidget {
  const TopServiceProviderCard({
    super.key,
    required this.item,
  });

  final TopServiceModel item;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
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
                const TRoundedContainer(
                  height: 104,
                  width: 90,
                  imageUrl: null, //item.imageUrl,
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
                        item.service,
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
                                item.rating,
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
                            '${item.reviews} Reviews',
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
              onPressed: () {},
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
