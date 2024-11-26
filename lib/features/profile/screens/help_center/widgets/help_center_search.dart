import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../../../utils/utils.dart';

class HelpCenterSearch extends StatelessWidget {
  const HelpCenterSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: TSizes.defaultSpace,
        vertical: TSizes.size8,
      ),
      child: TextField(
        onChanged: (value) {},
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(TSizes.size12),
            borderSide: const BorderSide(color: TColors.borderPrimary),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(TSizes.size12),
            borderSide: const BorderSide(color: TColors.borderPrimary),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(TSizes.size12),
            borderSide: const BorderSide(color: TColors.borderPrimary),
          ),
          hintText: TTexts.searchHC,
          hintStyle: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: TColors.darkerGrey),
          prefixIcon: const Icon(
            IconsaxPlusLinear.search_normal_1,
            color: TColors.green,
          ),
        ),
      ),
    );
  }
}
