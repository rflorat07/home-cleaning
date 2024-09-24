import 'package:flutter/material.dart';
import 'package:home_cleaning/utils/utils.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  final String image, title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: TDeviceUtils.getAppBarHeight() + TSizes.appBarHeight),
      child: Column(children: [
        Image(
          width: THelperFunctions.screenWidth(context) * 0.8,
          height: THelperFunctions.screenHeight(context) * 0.45,
          image: AssetImage(image),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: TSizes.defaultSpace),
        Text(
          subtitle,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: TColors.darkerGrey),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        )
      ]),
    );
  }
}
