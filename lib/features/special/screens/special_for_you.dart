import 'package:flutter/material.dart';

import '../../../common/widgets/appbar/appbar.dart';
import '../../../common/widgets/special_offer/special_offer.dart';
import '../../../utils/utils.dart';
import '../../home/controllers/special_offer_carousel.controllers.dart';

class SpecialForYouScreen extends StatelessWidget {
  const SpecialForYouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SpecialOfferCarouselController.instance;
    return Scaffold(
        appBar: const TAppBar(
          showBackArrow: true,
          title: TTexts.specialForYou,
        ),
        body: ListView.separated(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          physics: const BouncingScrollPhysics(),
          itemCount: controller.specialOffers.length,
          itemBuilder: (context, index) {
            return SpecialOfferCard(
                specialOffer: controller.specialOffers[index]);
          },
          separatorBuilder: (context, index) =>
              const SizedBox(height: TSizes.spaceBtwItems),
        ));
  }
}
