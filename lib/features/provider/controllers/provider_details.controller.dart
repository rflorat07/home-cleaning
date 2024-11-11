import 'package:get/get.dart';

import '../../../common/common.dart';
import '../../../data/repositories/service_provider/service_provider.repository.dart';

class ProviderDetailsController extends GetxController {
  static ProviderDetailsController get instance => Get.find();

  final isLoading = false.obs;
  RxInt selectedTabBar = 0.obs;
  final _topProviderRepository = Get.put(TopProviderRepository());
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
      providerDetails.value = details;
      providerDetails.refresh();
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
