import 'package:get/get.dart';
import 'package:home_cleaning/features/authentication/models/chip.model.dart';

class TChoiceChipListController extends GetxController {
  static TChoiceChipListController get instance => Get.find();

  RxList<ChipModel> chipList = <ChipModel>[].obs;

  @override
  void onInit() {
    fetchChipList();
    super.onInit();
  }

  Future<void> fetchChipList() async {
    chipList.assignAll(demoChip);
  }
}
