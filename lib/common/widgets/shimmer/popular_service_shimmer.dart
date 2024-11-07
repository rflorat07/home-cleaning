import 'package:flutter/material.dart';

import '../../../utils/utils.dart';
import '../../common.dart';

class TPopularServiceShimmerCard extends StatelessWidget {
  const TPopularServiceShimmerCard({
    super.key,
    this.padding,
    this.showBorder = true,
  });

  final EdgeInsetsGeometry? padding;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      height: TSizes.size135,
      radius: TSizes.borderRadiusLg,
      backgroundColor: TColors.white,
      showBorder: showBorder,
      padding: padding ?? const EdgeInsets.all(TSizes.size10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Container
          const TShimmerEffect(
            width: 110,
            height: 115,
            radius: TSizes.borderRadiusLg,
          ),

          const SizedBox(width: TSizes.defaultSpace / 2),

          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Service
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ...List.generate(
                        4,
                        (index) => const TShimmerEffect(
                          width: double.infinity / 3,
                          height: 20,
                          radius: TSizes.borderRadiusLg / 2,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 10.0),
                // Title - Icon - Name - Cost
              ],
            ),
          )

          // Title
        ],
      ),
    );
  }
}
