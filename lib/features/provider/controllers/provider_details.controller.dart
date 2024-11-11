import 'package:get/get.dart';

import '../../../common/common.dart';
import '../../../data/repositories/provider/provider.repository.dart';
import '../../../data/repositories/services/services.repository.dart';

class ProviderDetailsController extends GetxController {
  static ProviderDetailsController get instance => Get.find();

  final _servicesRepository = Get.put(ServicesRepository());
  final _topProviderRepository = Get.put(TopProviderRepository());

  RxBool isLoading = false.obs;
  RxInt selectedTabBar = 0.obs;
  RxList<ServiceModel> servicesDetails = <ServiceModel>[].obs;
  Rx<ProviderModel> providerDetails = ProviderModel.empty().obs;

  @override
  Future<void> onInit() async {
    await fetchProviderDetails();
    super.onInit();
  }

  Future<void> fetchProviderDetails() async {
    try {
      isLoading.value = true;

      var serviceId = Get.arguments;

      var details =
          await _topProviderRepository.fetchProviderDetails(serviceId);

      if (details.services.isNotEmpty) {
        for (var serviceId in details.services) {
          final item = await _servicesRepository.fetchServiceDetails(serviceId);
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
}
