import 'package:get/get.dart';

import '../../../common/common.dart';
import '../../../data/repositories/popular_services/popular_services.repository.dart';
import '../../home/controllers/popular_services_carousel.controllers.dart';

class BookmarkControllers extends GetxController {
  static BookmarkControllers get instance => Get.find();

  final isLoading = false.obs;
  final _popularServicesRepository = Get.put(PopularServicesRepository());
  final _popularServicesCarouselController =
      PopularServicesCarouselController.instance;

  RxList<PopularServiceModel> bookmarkList = <PopularServiceModel>[].obs;

  @override
  Future<void> onReady() async {
    fetchBookmarkList();
    super.onReady();
  }

  Future<void> fetchBookmarkList() async {
    try {
      isLoading.value = true;
      final bookmarks =
          await _popularServicesRepository.getAllBookmarkPopularServices();
      bookmarkList.assignAll(bookmarks);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> removeFromFavorites(PopularServiceModel item) async {
    try {
      isLoading.value = true;
      item.isBookmark = false;
      await _popularServicesRepository.removeFromFavorites(item.toJson());
      await fetchBookmarkList();
      await _popularServicesCarouselController.fetchPopularServices();
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
