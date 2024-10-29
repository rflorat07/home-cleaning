import 'package:flutter/material.dart';

import '../../../../../utils/utils.dart';

class TCustomHeader extends StatelessWidget {
  const TCustomHeader({
    super.key,
    this.info = '',
    required this.title,
    required this.subTitle,
    this.padding = const EdgeInsets.only(top: TSizes.size32),
  });

  final EdgeInsetsGeometry padding;
  final String title, subTitle, info;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Center(
        child: Column(
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: TSizes.size16),
            Text(
              subTitle,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .apply(color: TColors.darkerGrey),
            ),
            if (info.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: TSizes.size4),
                child: Text(
                  info,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .apply(color: TColors.green),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
