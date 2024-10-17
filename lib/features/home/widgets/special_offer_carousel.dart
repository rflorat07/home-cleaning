import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../common/common.dart';
import '../../../utils/utils.dart';
import '../controllers/special_offer_carousel.controllers.dart';

class TSpecialOfferCarousel extends StatelessWidget {
  const TSpecialOfferCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SpecialOfferCarouselController());

    return Column(
      children: [
        // CarouselView
        Obx(
          () => ConstrainedBox(
            constraints:
                const BoxConstraints(maxHeight: TSizes.carouselMaxHeight),
            child: CarouselView(
              itemSnapping: true,
              shrinkExtent: THelperFunctions.screenWidth(context) * 0.8,
              itemExtent: THelperFunctions.screenWidth(context) * 0.8,
              backgroundColor: TColors.black,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(TSizes.carouselBorderRadius),
              ),
              padding: const EdgeInsets.only(left: TSizes.defaultSpace),
              children: controller.specialOffers
                  .map((SpecialOfferModel item) => SpecialOfferCard(
                        specialOffer: item,
                      ))
                  .toList(),
            ),
          ),
        ),

        const SizedBox(height: TSizes.defaultSpace / 2),

        // PageIndicator
        SmoothPageIndicator(
          count: controller.specialOffers.length,
          controller: controller.smoothPageIndicatorController,
          effect: ScrollingDotsEffect(
            fixedCenter: false,
            dotWidth: TSizes.carouselDotSize,
            dotHeight: TSizes.carouselDotSize,
            dotColor: TColors.green.withOpacity(0.2),
            activeDotColor: TColors.green,
          ),
        ),
      ],
    );
  }
}
