import 'package:get/get.dart';
import 'package:home_cleaning/features/home/models/top_service.model.dart';

class TTopServiceProviderCarouselControlller extends GetxController {
  static TTopServiceProviderCarouselControlller get instance => Get.find();

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
