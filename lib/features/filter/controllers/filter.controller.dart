import 'package:get/get.dart';

import '../../authentication/models/chip.model.dart';

class FilterController extends GetxController {
  static FilterController get instance => Get.find();

  RxList<ChipModel> filterChipList = <ChipModel>[].obs;

  @override
  void onInit() {
    getFilterChipList();
    super.onInit();
  }

  void getFilterChipList() {
    filterChipList.assignAll(demoChip);
  }

  void setSelectedFilterChip(bool value, ChipModel chipItem) {
    var chips = filterChipList.map((item) {
      item == chipItem ? item.selected = value : item.selected = false;
      return item;
    }).toList();

    filterChipList.assignAll(chips);
  }
}
