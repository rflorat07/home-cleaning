import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../utils/utils.dart';

class BookinExpansionContent extends StatelessWidget {
  const BookinExpansionContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
        listTileTheme: ListTileTheme.of(context).copyWith(
          dense: true,
          minTileHeight: 0.0,
          minVerticalPadding: 0.0,
        ),
      ),
      child: ExpansionTile(
        shape: const RoundedRectangleBorder(),
        collapsedShape: const RoundedRectangleBorder(),
        showTrailingIcon: false,
        childrenPadding: const EdgeInsets.only(top: TSizes.size12),
        expandedAlignment: Alignment.topLeft,
        title: SizedBox(
          child: Padding(
            padding: const EdgeInsets.only(bottom: TSizes.size8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'View More',
                  style: textTheme.bodyLarge!.apply(color: TColors.green),
                ),
                const SizedBox(width: TSizes.size8),
                const Icon(IconsaxPlusLinear.arrow_down, color: TColors.green)
              ],
            ),
          ),
        ),
        children: [
          Row(
            children: [
              Text(
                'Booking for',
                style: textTheme.bodyLarge!.apply(color: TColors.darkerGrey),
              ),
              const SizedBox(width: 20),
              const Expanded(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    'October 04, 2023 | 10:00 AM',
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Address',
                style: textTheme.bodyLarge!.apply(color: TColors.darkerGrey),
              ),
              const SizedBox(width: 20),
              const Expanded(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    'Home, 1901 Thornridge Cir...',
                  ),
                ),
              ),
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
                    backgroundColor: WidgetStatePropertyAll(TColors.whiteSmoke),
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
    );
  }
}
