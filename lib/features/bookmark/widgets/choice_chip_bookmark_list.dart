import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';
import '../controllers/bookmark.controllers.dart';

class ChoiceChipBookmarkList extends StatelessWidget {
  const ChoiceChipBookmarkList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BookmarkControllers.instance;
    return Container(
      width: double.infinity,
      height: TSizes.size40,
      margin: const EdgeInsets.only(
          left: TSizes.defaultSpace, bottom: TSizes.spaceBtwItems),
      child: Obx(
        () => ListView.separated(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: controller.bookmarkChipList.length,
          itemBuilder: (context, index) {
            final chip = controller.bookmarkChipList[index];
            return ChoiceChip(
              label: Text(chip.title),
              labelStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: chip.selected ? TColors.white : TColors.darkerGrey),
              onSelected: (value) =>
                  controller.setSelectedBookmarkChip(value, chip),
              selected: chip.selected,
            );
          },
          separatorBuilder: (context, index) =>
              const SizedBox(width: TSizes.dotSize),
        ),
      ),
    );
  }
}
