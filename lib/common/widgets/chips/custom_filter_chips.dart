import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class CustomFilterChips extends StatelessWidget {
  const CustomFilterChips({
    super.key,
    required this.chips,
    this.height = TSizes.size40,
  });

  final double? height;
  final List<String> chips;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: ListView.separated(
        padding: const EdgeInsets.only(left: TSizes.defaultSpace),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: chips.length,
        itemBuilder: (context, index) {
          return ChoiceChip(
            label: Text(chips[index]),
            padding: const EdgeInsets.all(TSizes.size6),
            labelStyle: TextStyle(
                fontSize: TSizes.fontSize12,
                fontWeight: FontWeight.w500,
                color: index == 0 ? TColors.white : TColors.dark),
            onSelected: (value) {},
            selected: index == 0,
          );
        },
        separatorBuilder: (context, index) =>
            const SizedBox(width: TSizes.size8),
      ),
    );
  }
}
