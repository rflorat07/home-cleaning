import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/common.dart';
import '../../../data/repositories/popular_services/popular_services.repository.dart';
import '../../../utils/utils.dart';

class ServiceDetailsController extends GetxController {
  static ServiceDetailsController get instance => Get.find();

  RxInt selectedTabBar = 0.obs;
  RxBool isLoading = false.obs;
  RxBool isBookmarkChanged = false.obs;
  Rx<Color> appBarColor = Colors.transparent.obs;
  Rx<PopularServiceModel> serviceSelected = PopularServiceModel.empty().obs;

  final ScrollController scrollController = ScrollController();
  final _popularServicesRepository = Get.put(PopularServicesRepository());

  @override
  void onInit() {
    fetchServiceDetails();
    scrollController.addListener(() => updateColor(scrollController.offset));
    super.onInit();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Future<void> fetchServiceDetails() async {
    try {
      isLoading.value = true;
      var serviceId = Get.arguments;
      var serviceDetails =
          await _popularServicesRepository.fetchServiceDetails(serviceId);
      serviceSelected.value = serviceDetails;
      serviceSelected.refresh();
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
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

  Future<void> addToFavorites() async {
    try {
      isLoading.value = true;

      serviceSelected.update((serviceSelected) {
        serviceSelected?.isBookmark = !serviceSelected.isBookmark;
      });

      await _popularServicesRepository.updateBookmarks(
        serviceSelected.toJson(),
      );

      isBookmarkChanged.toggle();

      TLoaders.successSnackBar(
        title: 'Success!',
        message: serviceSelected.value.isBookmark
            ? 'Added to Favorites'
            : 'Removed from Favorites',
      );
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
