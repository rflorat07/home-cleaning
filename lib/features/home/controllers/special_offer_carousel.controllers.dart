import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/models/special_offer.model.dart';

class SpecialOfferCarouselController extends GetxController {
  static SpecialOfferCarouselController get instance => Get.find();

  final isLoading = false.obs;
  final carouselCurrentIndex = 0.obs;
  final smoothPageIndicatorController = PageController();
  RxList<SpecialOfferModel> specialOffers = <SpecialOfferModel>[].obs;

  void updatePageIndicator(index) => smoothPageIndicatorController.jumpToPage;

  @override
  void onInit() {
    fetchSpecialOffer();
    super.onInit();
  }

  Future<void> fetchSpecialOffer() async {
    specialOffers.assignAll(demoSpecialOffer);
  }

  void dotNavigationClick(index) {
    smoothPageIndicatorController.jumpTo(index.toDouble());
  }
}
