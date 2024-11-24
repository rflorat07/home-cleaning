import 'package:get/get.dart';

import '../../../data/repositories/address/address.repository.dart';
import '../models/address.model.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  RxBool isLoading = false.obs;
  RxList<AddressModel> addresses = <AddressModel>[].obs;

  final _addresRepository = Get.put(AddressRepository());

  @override
  void onInit() {
    super.onInit();
    fetchAddressRecord();
  }

  Future<void> fetchAddressRecord() async {
    try {
      isLoading.value = true;
      final addressList = await _addresRepository.getAllAddress();
      addresses(addressList);
    } catch (e) {
      addresses([]);
    } finally {
      isLoading.value = false;
    }
  }
}
