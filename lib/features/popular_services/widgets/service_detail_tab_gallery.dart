import 'package:flutter/material.dart';

import '../../../common/common.dart';
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
          SizedBox(
            height: ((MediaQuery.of(context).size.width - 40) / 2) * 3,
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(0.0),
              physics: const NeverScrollableScrollPhysics(),
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
          ),
        ],
      ),
    );
  }
}
