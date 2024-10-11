import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';
import '../controllers/choice_chip_list.controller.dart';

class TChoiceChipList extends StatelessWidget {
  const TChoiceChipList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TChoiceChipListController());
    return Container(
      width: double.infinity,
      height: 40.0,
      margin: const EdgeInsets.only(
          left: TSizes.defaultSpace, bottom: TSizes.spaceBtwItems),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: controller.chipList.length,
        itemBuilder: (context, index) {
          final chip = controller.chipList[index];
          return ChoiceChip(
            label: Text(chip.title),
            labelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                color: chip.selected ? TColors.white : TColors.darkerGrey),
            onSelected: (value) {},
            selected: chip.selected,
          );
        },
        separatorBuilder: (context, index) =>
            const SizedBox(width: TSizes.dotSize),
      ),
    );
  }
}
