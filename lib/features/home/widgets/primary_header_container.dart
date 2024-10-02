import 'package:flutter/material.dart';
import 'package:home_cleaning/utils/utils.dart';

import '../../../common/styles/spacing_styles.dart';
import '../../../common/widgets/icons/t_circular_icon.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: TSpacingStyle.paddingWithAppBarHeight,
      decoration: const BoxDecoration(
        image: DecorationImage(
          alignment: Alignment.bottomRight,
          image: AssetImage(TImages.homeHeader),
        ),
        color: TColors.green,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(TSizes.borderRadiusXl),
          bottomLeft: Radius.circular(TSizes.borderRadiusXl),
        ),
      ),
      child: Column(
        children: [
          // DropdownMenu location - Icon notification
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // DropdownMenu location
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    TTexts.location,
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .apply(color: TColors.white.withOpacity(0.7)),
                  ),
                  const DropdownMenu<String>(
                    leadingIcon: Icon(
                      Icons.location_on,
                      size: TSizes.iconMd,
                      color: TColors.yellow,
                    ),
                    selectedTrailingIcon: Icon(
                      Icons.keyboard_arrow_up,
                      size: TSizes.iconMd,
                      color: TColors.yellow,
                    ),
                    trailingIcon: Icon(
                      Icons.keyboard_arrow_down,
                      size: TSizes.iconMd,
                      color: TColors.yellow,
                    ),
                    initialSelection: 'NY',
                    dropdownMenuEntries: <DropdownMenuEntry<String>>[
                      DropdownMenuEntry(
                          value: 'NY', label: 'New York, USA', enabled: true),
                    ],
                  )
                ],
              ),
              // Icon notification
              TCircularIcon(
                icon: Icons.notifications,
                iconColor: TColors.white,
                width: TSizes.xxl,
                height: TSizes.xxl,
                backgroundColor: Colors.white.withOpacity(0.17),
                borderRadius: TSizes.borderRadiusMd,
              ),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          // Search - Filter
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: TSizes.spaceBtwItems),
                  height: TSizes.inputMaxHeight,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(TSizes.borderRadiusMd),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.search,
                        color: TColors.green,
                        size: TSizes.iconSl,
                      ),
                      const SizedBox(width: TSizes.sm),
                      Text(
                        'Search',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .apply(color: TColors.darkerGrey),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(width: TSizes.spaceBtwItems / 2),
              const TCircularIcon(
                icon: Icons.tune,
                iconColor: TColors.green,
                backgroundColor: Colors.white,
                width: TSizes.inputMaxHeight,
                height: TSizes.inputMaxHeight,
                borderRadius: TSizes.borderRadiusMd,
              ),
            ],
          )
          // Search
        ],
      ),
    );
  }
}
