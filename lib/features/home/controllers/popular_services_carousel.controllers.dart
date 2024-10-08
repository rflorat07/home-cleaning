import 'package:get/get.dart';

import '../models/popular_service.model.dart';

class PopularServicesCarouselController extends GetxController {
  static PopularServicesCarouselController get instance => Get.find();

  final isLoading = false.obs;
  final carouselCurrentIndex = 0.obs;
  RxList<PopularService> popularServices = <PopularService>[].obs;

  @override
  void onInit() {
    fetchPopularServices();
    super.onInit();
  }

  Future<void> fetchPopularServices() async {
    popularServices.assignAll(demoPopularService);
  }
}