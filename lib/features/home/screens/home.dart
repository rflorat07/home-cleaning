import 'package:flutter/material.dart';
import 'package:home_cleaning/features/home/widgets/popular_services_carousel.dart';
import 'package:home_cleaning/features/home/widgets/top_service_provider_carousel.dart';

import '../../../common/widgets/texts/section_heading.dart';
import '../../../utils/utils.dart';
import '../widgets/categories_carousel.dart';
import '../widgets/primary_header_container.dart';
import '../widgets/special_offer_carousel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0.0, backgroundColor: TColors.green),
      body: const SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            /// Header
            TPrimaryHeaderContainer(),

            SizedBox(height: TSizes.defaultSpace),

            /// Section Heading - SpecialForYou
            TSectionHeading(
              title: TTexts.specialForYou,
              horizontal: TSizes.defaultSpace,
            ),

            SizedBox(height: TSizes.spaceBtwItems),

            /// Special Offer Carousel
            TSpecialOfferCarousel(),

            SizedBox(height: TSizes.spaceBtwSections),

            /// Section Heading - Categories
            TSectionHeading(
              title: TTexts.categories,
              horizontal: TSizes.defaultSpace,
            ),

            SizedBox(height: TSizes.spaceBtwItems),

            ///  Categories Carousel
            TCategoriesCarousel(),

            SizedBox(height: TSizes.spaceBtwSections),

            /// Section Heading - Popular Services
            TSectionHeading(
              title: TTexts.popularServices,
              horizontal: TSizes.defaultSpace,
            ),

            SizedBox(height: TSizes.spaceBtwItems),

            /// Popular Services Carousel
            TPopularServicesCarousel(),

            SizedBox(height: TSizes.spaceBtwSections),

            /// Section Heading - Top Service provider
            TSectionHeading(
              title: TTexts.topServiceProvider,
              horizontal: TSizes.defaultSpace,
            ),

            SizedBox(height: TSizes.spaceBtwItems),

            /// Service Provider Carousel
            TTopServiceProviderCarousel(),

            SizedBox(height: TSizes.spaceBtwSections),

            /// Body
          ],
        ),
      ),
    );
  }
}
