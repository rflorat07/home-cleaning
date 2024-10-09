import 'package:flutter/material.dart';
import 'package:home_cleaning/features/home/controllers/top_service_provider_carousel.controllers.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../common/widgets/appbar/appbar.dart';
import '../../../utils/utils.dart';
import '../widgets/top_service_provider_card.dart';

class TopServiceProviderScreen extends StatelessWidget {
  const TopServiceProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TopServiceProviderCarouselControlller.instance;
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(TTexts.topServiceProvider,
            style: Theme.of(context).textTheme.titleMedium),
        actions: [
          IconButton.outlined(
            iconSize: TSizes.appBarIconSize,
            style: OutlinedButton.styleFrom(
                side: const BorderSide(color: TColors.borderPrimary)),
            onPressed: () {},
            icon: const Icon(IconsaxPlusLinear.search_normal_1),
          )
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        physics: const BouncingScrollPhysics(),
        itemCount: controller.topServiceProvider.length,
        itemBuilder: (context, index) {
          return TopServiceProviderCard(
              item: controller.topServiceProvider[index]);
        },
        separatorBuilder: (context, index) =>
            const SizedBox(height: TSizes.spaceBtwItems),
      ),
    );
  }
}
