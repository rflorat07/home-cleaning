import 'package:get/get.dart';

import '../../../common/models/category.model.dart';

class CategoryCarouselControlller extends GetxController {
  static CategoryCarouselControlller get instance => Get.find();

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
