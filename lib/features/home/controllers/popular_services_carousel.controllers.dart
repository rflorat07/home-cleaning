import 'package:get/get.dart';

import '../../../common/common.dart';
import '../../../data/repositories/popular_services/popular_services.repository.dart';

class PopularServicesCarouselController extends GetxController {
  static PopularServicesCarouselController get instance => Get.find();

  final isLoading = false.obs;
  final carouselCurrentIndex = 0.obs;
  final _popularServicesRepository = Get.put(PopularServicesRepository());
  RxList<PopularServiceModel> popularServices = <PopularServiceModel>[].obs;

  @override
  Future<void> onInit() async {
    fetchPopularServices();
    super.onInit();
  }

  Future<void> fetchPopularServices() async {
    try {
      isLoading.value = true;
      final services = await _popularServicesRepository.getAllPopularServices();
      popularServices.assignAll(services);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
