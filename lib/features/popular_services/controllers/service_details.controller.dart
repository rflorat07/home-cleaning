import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/models/popular_service.model.dart';
import '../../../utils/utils.dart';
import '../screens/service_details.dart';

class ServiceDetailsController extends GetxController {
  static ServiceDetailsController get instance => Get.find();

  PopularServiceModel _serviceSelected = PopularServiceModel.empty();

  RxInt selectedTabBar = 0.obs;
  var appBarColor = Colors.transparent.obs;
  final ScrollController scrollController = ScrollController();

  set serviceDetails(PopularServiceModel service) {
    _serviceSelected = service;
    Get.to(() => const ServiceDetailsScreen());
  }

  @override
  void onInit() {
    scrollController.addListener(() => updateColor(scrollController.offset));
    super.onInit();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  PopularServiceModel get serviceDetails {
    return _serviceSelected;
  }

  void updateColor(double offset) {
    if (offset > 100) {
      appBarColor.value =
          TColors.green.withOpacity(0.9); // Change to red when scrolled down
    } else {
      appBarColor.value =
          Colors.transparent; // Change back to blue when at the top
    }
  }
}
