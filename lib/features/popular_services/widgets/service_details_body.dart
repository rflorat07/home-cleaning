import 'package:flutter/material.dart';

import '../../../common/widgets/containers/rounded_container.dart';
import '../../../utils/utils.dart';

class ServiceDetailsBody extends StatelessWidget {
  const ServiceDetailsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: TSizes.defaultSpace,
          bottom: TSizes.defaultSpace / 2,
          left: TSizes.defaultSpace,
          right: TSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Service - Reviews
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Service
              TRoundedContainer(
                radius: TSizes.size6,
                backgroundColor: TColors.whiteSmoke,
                padding: const EdgeInsets.symmetric(
                    vertical: TSizes.size4, horizontal: TSizes.size8),
                child: Text(
                  'Home Cleaning',
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(color: TColors.green),
                ),
              ),

              // Reviews
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: TColors.starYellow,
                    size: TSizes.size18,
                  ),
                  const SizedBox(width: TSizes.size4),
                  Text(
                    '4.5 (365 reviews)',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .apply(color: TColors.darkerGrey),
                  )
                ],
              ),
              //
            ],
          ),

          const SizedBox(height: TSizes.spaceBtwItems),

          Text(
            'Deep House Cleaning',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontSize: TSizes.fontSize22),
          ),

          const SizedBox(height: TSizes.size12),

          Text(
            '1012 Ocean avanue, New yourk, USA',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: TColors.darkerGrey),
          ),
        ],
      ),
    );
  }
}
