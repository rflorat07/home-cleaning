import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/models/popular_service.model.dart';

class TSearchController extends GetxController {
  static TSearchController get instance => Get.find();

  var searchTerm = ''.obs;
  final TextEditingController searchTextController = TextEditingController();
  RxList<PopularServiceModel> popularServices = <PopularServiceModel>[].obs;

  @override
  void onInit() {
    fetchPopularServices();
    super.onInit();
  }

  Future<void> fetchPopularServices() async {
    popularServices.assignAll(demoPopularService);
  }

  List<PopularServiceModel> get filteredItems {
    if (searchTerm.value.isEmpty) {
      return popularServices;
    } else {
      return popularServices
          .where((item) =>
              item.offer.toLowerCase().contains(searchTerm.value.toLowerCase()))
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
