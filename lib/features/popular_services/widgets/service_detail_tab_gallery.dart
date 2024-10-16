import 'package:flutter/material.dart';
import 'package:home_cleaning/common/widgets/texts/section_heading.dart';

import '../../../utils/utils.dart';

class ServiceDetailTabGallery extends StatelessWidget {
  const ServiceDetailTabGallery({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //  Gallery Heading
          TSectionHeading(
            title: '${TTexts.galleryTab}(6)',
            textStyle: textTheme.bodyLarge,
            buttonTitle: TTexts.viewAll,
            textButtonStyle: textTheme.bodyLarge!.apply(color: TColors.green),
          ),

          const SizedBox(height: TSizes.spaceBtwItems),

          // Gallery IMG
          /*  Expanded(
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(0.0),
              crossAxisSpacing: TSizes.size8,
              mainAxisSpacing: TSizes.size8,
              crossAxisCount: 2,
              children: [
                ...List.generate(
                  6,
                  (_) => const TRoundedContainer(
                    radius: TSizes.size6,
                    backgroundColor: TColors.lightSilver,
                  ),
                )
              ],
            ),
          ) */
        ],
      ),
    );
  }
}
