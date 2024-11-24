import 'package:get/get.dart';
import 'package:map_launcher/map_launcher.dart';

import '../../../common/common.dart';
import '../../../data/repositories/provider/provider.repository.dart';
import '../../../data/repositories/services/services.repository.dart';
import '../../home/controllers/popular_services_carousel.controllers.dart';

class ProviderDetailsController extends GetxController {
  static ProviderDetailsController get instance => Get.find();

  final _servicesRepository = Get.put(ServicesRepository());
  final _topProviderRepository = Get.put(TopProviderRepository());
  final _popularServicesRepository = Get.put(ServicesRepository());
  final _popularServicesCarouselController =
      Get.put(PopularServicesCarouselController());

  RxBool isLoading = false.obs;
  RxInt selectedTabBar = 0.obs;
  RxList<ServiceModel> servicesDetails = <ServiceModel>[].obs;
  Rx<ProviderModel> providerDetails = ProviderModel.empty().obs;

  String serviceId = '';

  @override
  Future<void> onInit() async {
    serviceId = Get.arguments;
    await fetchProviderDetails();
    super.onInit();
  }

  Future<void> fetchProviderDetails() async {
    try {
      isLoading.value = true;

      var details =
          await _topProviderRepository.fetchProviderDetails(serviceId);

      if (details.services.isNotEmpty) {
        for (var serviceId in details.services) {
          final item = await _servicesRepository.fetchServiceDetails(serviceId);
          servicesDetails.clear();
          servicesDetails.add(item);
        }
      }

      providerDetails.value = details;

      providerDetails.refresh();
      servicesDetails.refresh();
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  List<ServiceModel> fetchServicesDetails(List<String> services) {
    return [ServiceModel.empty()];
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

  Future<void> removeFromFavorites(ServiceModel item) async {
    try {
      isLoading.value = true;
      item.isBookmark = !item.isBookmark;
      await _popularServicesRepository.updateBookmarks(item.toJson());
      await fetchProviderDetails();
      await _popularServicesCarouselController.fetchPopularServices();
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
