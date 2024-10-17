import 'package:get/get.dart';

import '../../../common/common.dart';

class TopServiceProviderCarouselControlller extends GetxController {
  static TopServiceProviderCarouselControlller get instance => Get.find();

  RxList<TopServiceModel> topServiceProvider = <TopServiceModel>[].obs;

  @override
  void onInit() {
    fetchTopServiceProvider();
    super.onInit();
  }

  Future<void> fetchTopServiceProvider() async {
    topServiceProvider.assignAll(demoTopService);
  }
}
