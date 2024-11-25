import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class AddressFilterChips extends StatelessWidget {
  const AddressFilterChips({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: TSizes.size35,
      child: ListView.separated(
        padding: const EdgeInsets.only(left: TSizes.defaultSpace),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: 4,
        itemBuilder: (context, index) {
          final chip = ['Home', 'Parent’s House', 'Farm House', 'Other'];
          return ChoiceChip(
            label: Text(chip[index]),
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
