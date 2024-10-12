import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class TSocialButtons extends StatelessWidget {
  const TSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: TSizes.iconXXL,
          width: TSizes.iconXXL,
          decoration: BoxDecoration(
            border: Border.all(color: TColors.borderPrimary),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
              onPressed: () {},
              icon: const Image(
                width: TSizes.iconMd,
                height: TSizes.iconMd,
                image: AssetImage(TImages.apple),
              )),
        ),
        const SizedBox(width: TSizes.defaultSpace / 2),
        Container(
          height: TSizes.iconXXL,
          width: TSizes.iconXXL,
          decoration: BoxDecoration(
            border: Border.all(color: TColors.borderPrimary),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
              onPressed: () {},
              icon: const Image(
                width: TSizes.iconMd,
                height: TSizes.iconMd,
                image: AssetImage(TImages.google),
              )),
        ),
        const SizedBox(width: TSizes.defaultSpace / 2),
        Container(
          height: TSizes.iconXXL,
          width: TSizes.iconXXL,
          decoration: BoxDecoration(
            border: Border.all(color: TColors.borderPrimary),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
              onPressed: () {},
              icon: const Image(
                width: TSizes.iconMd,
                height: TSizes.iconMd,
                image: AssetImage(TImages.facebook),
              )),
        ),
      ],
    );
  }
}
