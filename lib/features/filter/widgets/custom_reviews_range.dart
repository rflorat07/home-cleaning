import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class TCustomReviewsRange extends StatelessWidget {
  const TCustomReviewsRange({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> reviewsRange = [
      '4.5 and above',
      '4.0 - 4.5',
      '3.5 - 4.0',
      '3.0 - 3.5',
      '2.5 - 3.0'
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label
          Text(
            TTexts.reviews,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.w500),
          ),

          const SizedBox(height: TSizes.size6),

          ...List.generate(
            reviewsRange.length,
            (index) => Column(
              children: [
                SizedBox(
                  height: TSizes.size24,
                  child: ListTile(
                    dense: true,
                    minVerticalPadding: 0.0,
                    contentPadding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                    shape: const Border(bottom: BorderSide.none),
                    title: Row(
                      children: [
                        // Star Range
                        ...List.generate(
                          5,
                          (index) => const Row(
                            children: [
                              Icon(AppIcons.star,
                                  color: TColors.starYellow,
                                  size: TSizes.size20),
                              SizedBox(width: TSizes.size4),
                            ],
                          ),
                        ),
                        const SizedBox(width: TSizes.size8),
                        Text(
                          reviewsRange[index],
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                    // Radio
                    trailing: Radio<int>(
                      value: 0,
                      groupValue: index,
                      onChanged: (value) {},
                    ),
                  ),
                ),
                const SizedBox(height: TSizes.defaultSpace / 2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
