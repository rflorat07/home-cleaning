import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../common/common.dart';
import '../../../utils/utils.dart';

class YourProfileHeader extends StatelessWidget {
  const YourProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          const CircleAvatar(
            backgroundColor: TColors.lightSilver,
            radius: TSizes.size60,
          ),
          Positioned(
            bottom: 0.0,
            right: 0.0,
            child: TCircularIcon(
              width: TSizes.size36,
              height: TSizes.size36,
              size: TSizes.size18,
              showBorder: true,
              borderWidth: 2.0,
              borderColor: TColors.white,
              backgroundColor: TColors.primary,
              icon: IconsaxPlusLinear.edit_2,
              iconColor: TColors.white,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
