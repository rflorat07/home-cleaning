import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../common/styles/spacing_styles.dart';
import '../../../common/widgets/containers/rounded_container.dart';
import '../../../common/widgets/icons/t_circular_icon.dart';
import '../../../utils/utils.dart';

class TExploreHeaderContainer extends StatelessWidget {
  const TExploreHeaderContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: TSpacingStyle.paddingWithAppBarHeight,
      child: Padding(
        padding: const EdgeInsets.only(top: TSizes.spaceBtwItems),
        child: Row(
          children: [
            // Search bar
            Expanded(
              child: TRoundedContainer(
                radius: TSizes.borderRadiusMd,
                height: TSizes.inputMaxHeight,
                showBorder: true,
                padding: const EdgeInsets.only(left: TSizes.spaceBtwItems),
                child: Row(
                  children: [
                    const Icon(
                      IconsaxPlusLinear.search_normal_1,
                      color: TColors.green,
                      size: TSizes.iconSl,
                    ),
                    const SizedBox(width: TSizes.sm),
                    Text(
                      TTexts.searchServices,
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
            // Filter
            const TCircularIcon(
              size: TSizes.iconSl,
              iconColor: TColors.white,
              width: TSizes.inputMaxHeight,
              height: TSizes.inputMaxHeight,
              backgroundColor: TColors.green,
              icon: IconsaxPlusLinear.setting_4,
              borderRadius: TSizes.borderRadiusMd,
            ),
          ],
        ),
      ),
    );
  }
}
