import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../utils/utils.dart';

class TAddShippingAddress extends StatelessWidget {
  const TAddShippingAddress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: TColors.green,
      borderType: BorderType.RRect,
      dashPattern: const <double>[5, 2],
      padding: const EdgeInsets.all(TSizes.size1),
      radius: const Radius.circular(TSizes.size8),
      child: SizedBox(
        height: TSizes.size50,
        width: double.infinity,
        child: FilledButton(
          style: ButtonStyle(
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(TSizes.size8),
              ),
            ),
            backgroundColor: WidgetStateProperty.all(TColors.whiteSmoke),
          ),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                IconsaxPlusLinear.add,
                color: TColors.green,
                size: TSizes.size20,
              ),
              Text(
                'Add New Shipping Address',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: TColors.green,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
