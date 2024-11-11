import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/common.dart';
import '../../../utils/utils.dart';
import '../../category/screens/category.dart';
import '../../popular_services/screens/popular_services.dart';
import '../../provider/screens/top_providers.dart';
import '../../special/screens/Special_for_you.dart';
import '../widgets/categories_carousel.dart';
import '../widgets/popular_services_carousel.dart';
import '../widgets/primary_header_container.dart';
import '../widgets/special_offer_carousel.dart';
import '../widgets/top_service_provider_carousel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0.0, backgroundColor: TColors.green),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            /// Header
            const TPrimaryHeaderContainer(),

            const SizedBox(height: TSizes.defaultSpace),

            /// Section Heading - SpecialForYou
            TSectionHeading(
              title: TTexts.specialForYou,
              horizontal: TSizes.defaultSpace,
              onPressed: () => Get.to(() => const SpecialForYouScreen()),
            ),

            const SizedBox(height: TSizes.spaceBtwItems),

            /// Special Offer Carousel
            const TSpecialOfferCarousel(),

            const SizedBox(height: TSizes.spaceBtwSections),

            /// Section Heading - Categories
            TSectionHeading(
              title: TTexts.categories,
              horizontal: TSizes.defaultSpace,
              onPressed: () => Get.to(() => const CategoryScreen()),
            ),

            const SizedBox(height: TSizes.spaceBtwItems),

            ///  Categories Carousel
            const TCategoriesCarousel(),

            const SizedBox(height: TSizes.spaceBtwSections),

            /// Section Heading - Popular Services
            TSectionHeading(
              title: TTexts.popularServices,
              horizontal: TSizes.defaultSpace,
              onPressed: () => Get.to(() => const PopularServicesScreen()),
            ),

            const SizedBox(height: TSizes.spaceBtwItems),

            /// Popular Services Carousel
            const TPopularServicesCarousel(),

            const SizedBox(height: TSizes.spaceBtwSections),

            /// Section Heading - Top Service provider
            TSectionHeading(
              title: TTexts.topServiceProvider,
              horizontal: TSizes.defaultSpace,
              onPressed: () => Get.to(() => const TopProvidersScreen()),
            ),

            const SizedBox(height: TSizes.spaceBtwItems),

            /// Service Provider Carousel
            const TTopServiceProviderCarousel(),

            const SizedBox(height: TSizes.spaceBtwSections),

            /// Body
          ],
        ),
      ),
    );
  }
}
