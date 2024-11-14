import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';
import '../controllers/filter.controller.dart';

class TCustomFilterChipList extends StatelessWidget {
  const TCustomFilterChipList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FilterController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        Padding(
          padding: const EdgeInsets.only(left: TSizes.defaultSpace),
          child: Text(
            TTexts.category,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.w500),
          ),
        ),

        const SizedBox(height: TSizes.size12),

        Obx(
          () => SizedBox(
            height: TSizes.size40,
            child: ListView.separated(
              padding: const EdgeInsets.only(left: TSizes.defaultSpace),
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: controller.filterChipList.length,
              itemBuilder: (context, index) {
                final chip = controller.filterChipList[index];
                return ChoiceChip(
                  label: Text(chip.title),
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      color:
                          chip.selected ? TColors.white : TColors.darkerGrey),
                  onSelected: (value) =>
                      controller.setSelectedFilterChip(value, chip),
                  selected: chip.selected,
                );
              },
              separatorBuilder: (context, index) =>
                  const SizedBox(width: TSizes.dotSize),
            ),
          ),
        ),
      ],
    );
  }
}
