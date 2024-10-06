import 'package:flutter/material.dart';
import 'package:home_cleaning/features/home/widgets/dropdown_location.dart';
import 'package:home_cleaning/features/home/widgets/search_filter.dart';
import 'package:home_cleaning/utils/utils.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        top: TSizes.spaceBtwItems / 2,
        left: TSizes.defaultSpace,
        bottom: TSizes.defaultSpace,
        right: TSizes.defaultSpace,
      ),
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
      child: const Column(
        children: [
          // DropdownMenu location - Icon notification
          TDropdownlocation(),

          SizedBox(height: TSizes.spaceBtwItems),

          // Search - Filter
          TSearchFilter()
          // Search
        ],
      ),
    );
  }
}
