import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_launcher/map_launcher.dart';

import '../../../common/common.dart';
import '../../../data/repositories/services/services.repository.dart';
import '../../../utils/utils.dart';

class ServiceDetailsController extends GetxController {
  static ServiceDetailsController get instance => Get.find();

  RxInt selectedTabBar = 0.obs;
  RxBool isLoading = false.obs;
  RxBool isBookmarkChanged = false.obs;
  Rx<Color> appBarColor = Colors.transparent.obs;
  Rx<ServiceModel> serviceSelected = ServiceModel.empty().obs;

  final ScrollController scrollController = ScrollController();
  final _popularServicesRepository = Get.put(ServicesRepository());

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
      appBarColor.value = TColors.green
          .withValues(alpha: 0.9); // Change to red when scrolled down
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

  Future<void> mapLauncher(GeoModel? location, String address) async {
    if (location != null) {
      final availableMaps = await MapLauncher.installedMaps;
      await availableMaps.first.showMarker(
        coords: Coords(location.lat, location.lng),
        title: address,
      );
    }
  }
}
