import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class TCustomAvailableDate extends StatelessWidget {
  const TCustomAvailableDate({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: TSizes.defaultSpace, vertical: TSizes.size12),
          child: Text(
            TTexts.availableDate,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.w500),
          ),
        ),

        const SizedBox(height: TSizes.size6),

        SizedBox(
          height: TSizes.size55,
          child: ListView.separated(
            padding: const EdgeInsets.only(left: TSizes.defaultSpace),
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            itemBuilder: (context, index) {
              return ChoiceChip(
                label: Column(
                  children: [
                    Text(
                      'Today',
                      style: Theme.of(context).textTheme.labelLarge!.apply(
                          color: index == 0 ? Colors.white : TColors.black),
                    ),
                    Text(
                      '4 Oct',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: TSizes.fontSize15,
                          color: index == 0 ? Colors.white : TColors.black),
                    )
                  ],
                ),
                labelPadding:
                    const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
                onSelected: (value) {},
                selected: index == 0,
              );
            },
            separatorBuilder: (context, index) =>
                const SizedBox(width: TSizes.size8),
          ),
        ),

        const SizedBox(height: TSizes.defaultSpace),
      ],
    );
  }
}
