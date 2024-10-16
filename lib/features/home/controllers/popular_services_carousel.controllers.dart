import 'package:get/get.dart';

import '../../../common/models/popular_service.model.dart';

class PopularServicesCarouselController extends GetxController {
  static PopularServicesCarouselController get instance => Get.find();

  final isLoading = false.obs;
  final carouselCurrentIndex = 0.obs;
  RxList<PopularServiceModel> popularServices = <PopularServiceModel>[].obs;

  @override
  void onInit() {
    fetchPopularServices();
    super.onInit();
  }

  Future<void> fetchPopularServices() async {
    popularServices.assignAll(demoPopularService);
  }
}
