import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../common/models/popular_service.model.dart';
import '../../../common/widgets/containers/rounded_container.dart';
import '../../../utils/utils.dart';

class TPopularServiceCard extends StatelessWidget {
  const TPopularServiceCard({
    super.key,
    required this.item,
  });

  final PopularServiceModel item;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return TRoundedContainer(
      height: 135,
      radius: TSizes.borderRadiusLg,
      backgroundColor: TColors.white,
      showBorder: true,
      padding: const EdgeInsets.all(TSizes.cardPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Container
          TRoundedContainer(
            width: 110,
            imageUrl: item.imageUrl,
            radius: TSizes.borderRadiusLg,
            backgroundColor: TColors.lightSilver,
            padding: const EdgeInsets.all(TSizes.defaultSpace / 2),
          ),

          const SizedBox(width: TSizes.defaultSpace / 2),

          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Service
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Offer
                      TRoundedContainer(
                        radius: TSizes.borderRadiusLg / 2,
                        backgroundColor: TColors.whiteSmoke,
                        padding: const EdgeInsets.symmetric(
                            vertical: TSizes.xs, horizontal: TSizes.sm),
                        child: Text(
                          item.offer,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.labelSmall!.copyWith(
                              color: TColors.green,
                              fontWeight: FontWeight.w400),
                        ),
                      ),

                      const SizedBox(height: TSizes.xs),

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
                          // Icon Profile
                          const Icon(IconsaxPlusBold.profile,
                              color: TColors.green, size: 20),

                          const SizedBox(width: TSizes.xs / 2),

                          // Profile name
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

                // Bookmark Button
                IconButton(
                  onPressed: () {},
                  icon: const Icon(AppIcons.bookmark, color: TColors.green),
                  iconSize: TSizes.iconMd,
                )
                // Title - Icon - Name - Cost
              ],
            ),
          )

          // Title
        ],
      ),
    );
  }
}
