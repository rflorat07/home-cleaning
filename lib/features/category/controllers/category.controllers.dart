import 'package:get/get.dart';

import '../../../common/models/category.model.dart';

class CategoryControllers extends GetxController {
  static CategoryControllers get instance => Get.find();

  RxList<CategoryModel> categories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async {
    categories.assignAll(demoCategories);
  }
}
