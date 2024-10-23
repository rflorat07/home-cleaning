import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../common/common.dart';
import '../../../utils/utils.dart';
import '../enums/booking_type.enum.dart';

class TBookingList extends StatelessWidget {
  const TBookingList({
    super.key,
    required this.type,
    required this.items,
  });

  final BookingType type;
  final List<PopularServiceModel> items;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        ...List.generate(
          1,
          (index) => TRoundedContainer(
            width: double.infinity,
            radius: TSizes.borderRadiusLg,
            backgroundColor: TColors.white,
            showBorder: true,
            padding: const EdgeInsets.all(TSizes.size10),
            child: Column(
              children: [
                Row(
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
                                    'Car Repairing',
                                    overflow: TextOverflow.ellipsis,
                                    style: textTheme.labelSmall!.copyWith(
                                        color: TColors.green,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),

                                const SizedBox(height: TSizes.xs),

                                // Title
                                Text(
                                  'SUV Car Repairing',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: textTheme.bodyLarge!
                                      .copyWith(fontSize: 15),
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
                                      'Bessie Cooper',
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
                                  '\$180.0',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: textTheme.bodyLarge!
                                      .apply(color: TColors.green),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Title
                  ],
                ),
                const SizedBox(height: TSizes.size12),
                const Divider(),
                Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    childrenPadding: const EdgeInsets.symmetric(
                        vertical: TSizes.spaceBtwItems),
                    showTrailingIcon: false,
                    expandedAlignment: Alignment.topLeft,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'View More',
                          style: textTheme.bodyLarge,
                        ),
                        const SizedBox(width: TSizes.size10),
                        const Icon(IconsaxPlusLinear.arrow_down,
                            color: TColors.green)
                      ],
                    ),
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Booking for'),
                          Text('October 04, 2023 | 10:00 AM'),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Address'),
                          Text('Home, 1901 Thornridge Circo'),
                        ],
                      ),
                      const SizedBox(height: TSizes.defaultSpace),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: FilledButton(
                              onPressed: () {},
                              style: const ButtonStyle(
                                backgroundColor:
                                    WidgetStatePropertyAll(TColors.whiteSmoke),
                              ),
                              child: const Text(
                                TTexts.cancel,
                                style: TextStyle(color: TColors.green),
                              ),
                            ),
                          ),
                          const SizedBox(width: TSizes.size10),
                          Expanded(
                            child: FilledButton(
                              onPressed: () {},
                              child: const Text(TTexts.eReceipt),
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
        ),
      ],
    );
  }
}
