import 'package:get/get.dart';

import '../models/special_offer.model.dart';

class SpecialOfferCarouselController extends GetxController {
  static SpecialOfferCarouselController get instance => Get.find();

  @override
  void onInit() {
    fetchSpecialOffer();
    super.onInit();
  }

  final isLoading = false.obs;
  final carouselCurrentIndex = 0.obs;
  RxList<SpecialOfferModel> specialOffers = <SpecialOfferModel>[].obs;

  Future<void> fetchSpecialOffer() async {
    specialOffers.assignAll(demoSpecialOffer);
  }
}
