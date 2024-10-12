import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../common/widgets/icons/t_circular_icon.dart';
import '../../../utils/utils.dart';

class TProfileAvatar extends StatelessWidget {
  const TProfileAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          // Avatar
          Stack(
            children: [
              const CircleAvatar(
                backgroundColor: TColors.lightSilver,
                radius: TSizes.avatarRadius,
              ),
              Positioned(
                bottom: 0.0,
                right: 0.0,
                child: TCircularIcon(
                  width: TSizes.iconXL,
                  height: TSizes.iconXL,
                  size: TSizes.iconSl,
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

          const SizedBox(height: TSizes.spaceBtwItems),

          // Name
          Text('Esther Howard',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
