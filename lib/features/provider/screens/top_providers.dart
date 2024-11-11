import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../common/common.dart';
import '../../../utils/utils.dart';
import '../controllers/top_provider.controllers.dart';
import '../widgets/top_service_provider_card.dart';

class TopProvidersScreen extends StatelessWidget {
  const TopProvidersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TopProviderControlller.instance;
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: TTexts.topServiceProvider,
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
        itemCount: controller.topProviders.length,
        itemBuilder: (context, index) {
          return TopServiceProviderCard(item: controller.topProviders[index]);
        },
        separatorBuilder: (context, index) =>
            const SizedBox(height: TSizes.spaceBtwItems),
      ),
    );
  }
}
