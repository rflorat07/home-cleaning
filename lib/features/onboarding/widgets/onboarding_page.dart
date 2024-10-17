import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

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
    final richTextTitle = title.split('*');
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
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: richTextTitle.isNotEmpty ? richTextTitle[0] : null,
              style: Theme.of(context).textTheme.headlineMedium,
              children: <TextSpan>[
                TextSpan(
                  // ignore: prefer_is_empty
                  text: richTextTitle.length > 1 ? richTextTitle[1] : null,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: TColors.green,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                TextSpan(
                  text: richTextTitle.length > 2 ? richTextTitle[2] : null,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ]),
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
