import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../common/widgets/icons/t_circular_icon.dart';
import '../../../utils/utils.dart';
import '../../search/screens/search.dart';

class TSearchFilter extends StatelessWidget {
  const TSearchFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Search bar
        Expanded(
          child: GestureDetector(
            onTap: () => Get.to(() => const SearchScreen()),
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
                    IconsaxPlusLinear.search_normal_1,
                    color: TColors.green,
                    size: TSizes.iconSl,
                  ),
                  const SizedBox(width: TSizes.sm),
                  Text(
                    TTexts.search,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .apply(color: TColors.darkerGrey),
                  )
                ],
              ),
            ),
          ),
        ),

        const SizedBox(width: TSizes.spaceBtwItems / 2),
        // Filter
        const TCircularIcon(
          icon: IconsaxPlusLinear.setting_4,
          iconColor: TColors.green,
          size: TSizes.iconSl,
          backgroundColor: Colors.white,
          width: TSizes.inputMaxHeight,
          height: TSizes.inputMaxHeight,
          borderRadius: TSizes.borderRadiusMd,
        ),
      ],
    );
  }
}
