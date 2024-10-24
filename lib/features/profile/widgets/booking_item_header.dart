import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../common/common.dart';
import '../../../utils/utils.dart';
import '../models/booking.model.dart';

class BookingItemHeader extends StatelessWidget {
  const BookingItemHeader({
    super.key,
    required this.item,
  });

  final BookingModel item;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Image Container
        const TRoundedContainer(
          width: TSizes.size110,
          height: TSizes.size115,
          imageUrl: '',
          radius: TSizes.size12,
          backgroundColor: TColors.lightSilver,
          padding: EdgeInsets.all(TSizes.defaultSpace / 2),
        ),

        const SizedBox(width: TSizes.size12),

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
                      radius: TSizes.size6,
                      backgroundColor: TColors.whiteSmoke,
                      padding: const EdgeInsets.symmetric(
                        vertical: TSizes.size4,
                        horizontal: TSizes.size8,
                      ),
                      child: Text(
                        item.category,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.labelSmall!.copyWith(
                            color: TColors.green, fontWeight: FontWeight.w400),
                      ),
                    ),

                    const SizedBox(height: TSizes.xs),

                    // Title
                    Text(
                      item.service,
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
                      item.cost,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.bodyLarge!.apply(color: TColors.green),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        // Title
      ],
    );
  }
}
