import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/common.dart';
import '../../home/controllers/popular_services_carousel.controllers.dart';

class TSearchController extends GetxController {
  static TSearchController get instance => Get.find();

  var searchTerm = ''.obs;
  final controller = PopularServicesCarouselController.instance;
  final TextEditingController searchTextController = TextEditingController();
  RxList<ServiceModel> popularServices = <ServiceModel>[].obs;

  @override
  void onInit() {
    fetchPopularServices();
    super.onInit();
  }

  Future<void> fetchPopularServices() async {
    popularServices.assignAll(controller.popularServices);
  }

  List<ServiceModel> get filteredItems {
    if (searchTerm.value.isEmpty) {
      return popularServices;
    } else {
      return popularServices
          .where((item) => item.category
              .toLowerCase()
              .contains(searchTerm.value.toLowerCase()))
          .toList();
    }
  }

  void updateSearchTerm(String term) {
    searchTerm.value = term;
  }

  void resetTextField() {
    searchTerm.value = '';
    searchTextController.clear(); // This resets the TextField text to empty
  }
}
