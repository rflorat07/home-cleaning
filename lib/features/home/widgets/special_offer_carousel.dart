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

    return Obx(
      () {
        // Loader
        if (controller.isLoading.value) {
          return TCarouselView(
            widthFactor: 0.8,
            backgroundColor: Colors.transparent,
            maxHeight: TSizes.carouselMaxHeight,
            children: [
              TShimmerEffect(
                  width: THelperFunctions.screenWidth(context) * 0.8,
                  height: TSizes.carouselMaxHeight),
              TShimmerEffect(
                  width: THelperFunctions.screenWidth(context) * 0.8,
                  height: TSizes.carouselMaxHeight)
            ],
          );
        }

        if (controller.specialOffers.isEmpty) {
          return const Center(child: Text('No Data Found!'));
        }

        return Obx(
          () => Column(
            children: [
              // CarouselView
              TCarouselView(
                widthFactor: 0.8,
                backgroundColor: TColors.black,
                maxHeight: TSizes.carouselMaxHeight,
                children: controller.specialOffers
                    .map((SpecialOfferModel item) => SpecialOfferCard(
                          specialOffer: item,
                        ))
                    .toList(),
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
                  dotColor: TColors.green.withValues(alpha: 0.2),
                  activeDotColor: TColors.green,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
