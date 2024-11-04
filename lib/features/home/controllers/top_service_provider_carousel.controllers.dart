import 'package:get/get.dart';

import '../../../common/common.dart';
import '../../../data/repositories/service_provider/service_provider.repository.dart';

class TopServiceProviderCarouselControlller extends GetxController {
  static TopServiceProviderCarouselControlller get instance => Get.find();

  final isLoading = false.obs;
  final _topServiceProviderRepository = Get.put(TopServiceProviderRepository());
  RxList<TopServiceModel> topServiceProvider = <TopServiceModel>[].obs;

  @override
  Future<void> onInit() async {
    fetchTopServiceProvider();
    super.onInit();
  }

  Future<void> fetchTopServiceProvider() async {
    try {
      isLoading.value = true;
      final topServices =
          await _topServiceProviderRepository.getAllTopService();
      topServiceProvider.assignAll(topServices);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
