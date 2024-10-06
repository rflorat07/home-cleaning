import 'package:flutter/material.dart';

import '../../../common/widgets/texts/section_heading.dart';
import '../../../utils/utils.dart';
import '../widgets/categories_carousel.dart';
import '../widgets/primary_header_container.dart';
import '../widgets/special_offer_carousel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
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

            SizedBox(height: TSizes.defaultSpace / 2),

            /// Special Offer Carousel
            TSpecialOfferCarousel(),

            SizedBox(height: TSizes.defaultSpace / 2),

            /// Section Heading - Categories
            TSectionHeading(
              title: TTexts.categories,
              horizontal: TSizes.defaultSpace,
            ),

            ///  Categories Carousel
            TCategoriesCarousel(),

            /// Body
          ],
        ),
      ),
    );
  }
}
