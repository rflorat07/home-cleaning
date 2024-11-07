import 'package:get/get.dart';

import '../../../common/common.dart';
import '../../../data/repositories/popular_services/popular_services.repository.dart';
import '../../authentication/models/chip.model.dart';
import '../../home/controllers/popular_services_carousel.controllers.dart';

class BookmarkControllers extends GetxController {
  static BookmarkControllers get instance => Get.find();

  final isLoading = false.obs;
  final _popularServicesRepository = Get.put(PopularServicesRepository());
  final _popularServicesCarouselController =
      PopularServicesCarouselController.instance;

  RxString chipSelected = 'All'.obs;
  RxList<ChipModel> bookmarkChipList = <ChipModel>[].obs;
  RxList<PopularServiceModel> bookmarkList = <PopularServiceModel>[].obs;

  @override
  Future<void> onReady() async {
    initData();
    super.onReady();
  }

  Future<void> initData() async {
    await fetchBookmarkList();
    getBookmarkChipList();
  }

  Future<void> fetchBookmarkList() async {
    try {
      isLoading.value = true;
      // Start Loading
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
      await _popularServicesRepository.updateBookmarks(item.toJson());
      await fetchBookmarkList();
      await _popularServicesCarouselController.fetchPopularServices();
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void getBookmarkChipList() {
    bookmarkChipList.assignAll(demoChip);
  }

  void setSelectedBookmarkChip(bool value, ChipModel chipItem) {
    var chips = bookmarkChipList.map((item) {
      item == chipItem ? item.selected = value : item.selected = false;
      return item;
    }).toList();

    chipSelected.value = chipItem.title;
    bookmarkChipList.assignAll(chips);
  }

  List<PopularServiceModel> get allBookmark {
    return (chipSelected.toLowerCase() == 'all')
        ? bookmarkList
        : bookmarkList
            .where((item) =>
                item.title.toLowerCase().contains(chipSelected.toLowerCase()))
            .toList();
  }
}
