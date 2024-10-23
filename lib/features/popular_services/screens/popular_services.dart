import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../common/widgets/appbar/appbar.dart';
import '../../../utils/utils.dart';
import '../../home/controllers/popular_services_carousel.controllers.dart';
import '../../search/screens/search.dart';
import '../widgets/popular_service_card.dart';

class PopularServicesScreen extends StatelessWidget {
  const PopularServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PopularServicesCarouselController.instance;
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: TTexts.popularServices,
        actions: [
          IconButton.outlined(
            iconSize: TSizes.appBarIconSize,
            style: OutlinedButton.styleFrom(
                side: const BorderSide(color: TColors.borderPrimary)),
            onPressed: () => Get.to(() => const SearchScreen()),
            icon: const Icon(IconsaxPlusLinear.search_normal_1),
          )
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        physics: const BouncingScrollPhysics(),
        itemCount: controller.popularServices.length,
        itemBuilder: (context, index) {
          return TPopularServiceCard(item: controller.popularServices[index]);
        },
        separatorBuilder: (context, index) =>
            const SizedBox(height: TSizes.spaceBtwItems),
      ),
    );
  }
}
