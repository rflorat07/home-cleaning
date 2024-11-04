import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/common.dart';
import '../../../data/repositories/special_offers/special_offers.repository.dart';

class SpecialOfferCarouselController extends GetxController {
  static SpecialOfferCarouselController get instance => Get.find();

  final isLoading = false.obs;
  final carouselCurrentIndex = 0.obs;
  final smoothPageIndicatorController = PageController();
  final _specialOffersRepository = Get.put(SpecialOffersRepository());
  RxList<SpecialOfferModel> specialOffers = <SpecialOfferModel>[].obs;

  void updatePageIndicator(index) => smoothPageIndicatorController.jumpToPage;

  @override
  Future<void> onInit() async {
    fetchSpecialOffer();
    super.onInit();
  }

  Future<void> fetchSpecialOffer() async {
    try {
      isLoading.value = true;
      final alloffers = await _specialOffersRepository.getAllSpecialOffers();
      specialOffers.assignAll(alloffers);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void dotNavigationClick(index) {
    smoothPageIndicatorController.jumpTo(index.toDouble());
  }
}
