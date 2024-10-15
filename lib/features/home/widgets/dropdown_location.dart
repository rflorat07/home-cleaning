import 'package:flutter/material.dart';
import 'package:home_cleaning/common/widgets/icons/t_circular_icon.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../utils/utils.dart';

class TDropdownlocation extends StatelessWidget {
  const TDropdownlocation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // DropdownMenu location
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // -- Location
            Text(
              TTexts.location,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .apply(color: TColors.white.withOpacity(0.7)),
            ),

            const SizedBox(height: TSizes.xs),

            // -- Location Icon - DropdownButton
            Row(
              children: [
                // -- Location Icon
                const Icon(
                  IconsaxPlusBold.location,
                  color: TColors.yellow,
                  size: TSizes.appBarIconSize,
                ),

                const SizedBox(width: TSizes.xs),

                // --  DropdownButton
                SizedBox(
                  height: TSizes.defaultSpace,
                  child: DropdownButton<String>(
                    value: 'NY',
                    elevation: 0,
                    dropdownColor: TColors.darkerGrey,
                    underline: const SizedBox(height: 0.0),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: TSizes.fontSize14,
                    ),
                    icon: const Padding(
                      padding: EdgeInsets.only(left: TSizes.xs),
                      child: Icon(Icons.keyboard_arrow_down,
                          color: TColors.yellow),
                    ),
                    items: const [
                      DropdownMenuItem<String>(
                          value: 'NY',
                          enabled: true,
                          child: Text(
                            'New York, USA',
                          )),
                    ],
                    onChanged: (String? value) {},
                  ),
                ),
              ],
            ),
          ],
        ),

        // Icon notification
        TCircularIcon(
          icon: IconsaxPlusBold.notification,
          iconColor: TColors.white,
          width: TSizes.xxl,
          height: TSizes.xxl,
          backgroundColor: Colors.white.withOpacity(0.17),
          borderRadius: TSizes.borderRadiusMd,
        ),
      ],
    );
  }
}
