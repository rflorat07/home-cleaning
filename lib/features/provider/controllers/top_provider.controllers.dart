import 'package:get/get.dart';

import '../../../common/common.dart';
import '../../../data/repositories/service_provider/service_provider.repository.dart';
import '../screens/provider_details.dart';

class TopProviderControlller extends GetxController {
  static TopProviderControlller get instance => Get.find();

  final isLoading = false.obs;
  final _topProviderRepository = Get.put(TopProviderRepository());

  RxList<ProviderModel> topProviders = <ProviderModel>[].obs;
  Rx<ProviderModel> providerDetails = ProviderModel.empty().obs;

  @override
  Future<void> onInit() async {
    await fetchTopProviders();
    super.onInit();
  }

  Future<void> fetchTopProviders() async {
    try {
      isLoading.value = true;
      final providers = await _topProviderRepository.getTopProviders();
      topProviders.assignAll(providers);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> openProviderDetails(ProviderModel service) async {
    Get.to(() => const ProviderDetailsScreen(), arguments: service.id);
  }
}
