import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../utils/utils.dart';

class TCustomDropdownButton extends StatelessWidget {
  const TCustomDropdownButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label
          Text(
            TTexts.location,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.w500),
          ),

          const SizedBox(height: TSizes.size12),
          Container(
            height: TSizes.size44,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
                vertical: TSizes.size8, horizontal: TSizes.size16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(TSizes.size8),
              border: Border.all(color: TColors.borderPrimary),
            ),
            child: DropdownButton<String>(
                hint: const Text('New York, USA'),
                isExpanded: true,
                elevation: 10,
                value: null,
                onChanged: (String? newValue) {},
                underline: const SizedBox(height: 0.0),
                dropdownColor: TColors.whiteSmoke,
                style: const TextStyle(
                    fontSize: TSizes.fontSize15,
                    color: TColors.black,
                    fontWeight: FontWeight.w500),
                icon: const Padding(
                  padding: EdgeInsets.only(left: TSizes.xs),
                  child:
                      Icon(IconsaxPlusLinear.arrow_down, color: TColors.green),
                ),
                items: const []),
          ),
        ],
      ),
    );
  }
}
