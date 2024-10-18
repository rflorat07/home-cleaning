import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../common/common.dart';
import '../../../utils/utils.dart';

class ServiceProviderDetailsBody extends StatelessWidget {
  const ServiceProviderDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        children: [
          Row(
            children: [
              const Stack(
                children: [
                  CircleAvatar(
                    radius: TSizes.size48,
                    backgroundColor: TColors.lightSilver,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Icon(
                      AppIcons.verify,
                      color: TColors.green,
                      size: TSizes.size25,
                    ),
                  )
                ],
              ),
              const SizedBox(width: TSizes.size16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Jenny Wilson',
                      style: textTheme.headlineSmall,
                    ),
                    const SizedBox(height: TSizes.size4),
                    Text(
                      'Cleaning Services',
                      style: textTheme.bodyMedium!
                          .apply(color: TColors.darkerGrey),
                    ),
                    const SizedBox(height: TSizes.size4),
                    Row(
                      children: [
                        const Icon(IconsaxPlusBold.location,
                            size: TSizes.size16, color: TColors.green),
                        const SizedBox(width: TSizes.size2),
                        Text('New York, United Stats',
                            style: textTheme.bodyMedium!
                                .apply(color: TColors.darkerGrey)),
                        const SizedBox(width: TSizes.size2),
                        const Icon(IconsaxPlusBold.map_1,
                            size: TSizes.size19, color: TColors.green),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: TSizes.defaultSpace),
          const Divider(),
          const SizedBox(height: TSizes.defaultSpace),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TRoundedIconText(
                label: '7,500+',
                icon: IconsaxPlusBold.profile_2user,
                width: TSizes.size60,
                height: TSizes.size60,
                onPressed: () {},
                style: textTheme.titleLarge!.apply(color: TColors.green),
                child: Text(
                  'Customer',
                  style: textTheme.labelLarge!.apply(color: TColors.darkerGrey),
                ),
              ),
              TRoundedIconText(
                label: '10+',
                icon: IconsaxPlusBold.briefcase,
                width: TSizes.size60,
                height: TSizes.size60,
                onPressed: () {},
                style: textTheme.titleLarge!.apply(color: TColors.green),
                child: Text(
                  'Years Exp.',
                  style: textTheme.labelLarge!.apply(color: TColors.darkerGrey),
                ),
              ),
              TRoundedIconText(
                label: '4.9+',
                icon: IconsaxPlusBold.star_1,
                width: TSizes.size60,
                height: TSizes.size60,
                onPressed: () {},
                style: textTheme.titleLarge!.apply(color: TColors.green),
                child: Text(
                  'Rating',
                  style: textTheme.labelLarge!.apply(color: TColors.darkerGrey),
                ),
              ),
              TRoundedIconText(
                label: '4,956',
                icon: IconsaxPlusBold.message,
                width: TSizes.size60,
                height: TSizes.size60,
                onPressed: () {},
                style: textTheme.titleLarge!.apply(color: TColors.green),
                child: Text(
                  'Review',
                  style: textTheme.labelLarge!.apply(color: TColors.darkerGrey),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
