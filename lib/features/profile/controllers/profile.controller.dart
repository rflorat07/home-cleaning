import 'package:get/get.dart';

import '../models/profile.model.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  RxList<ProfileModel> profileListTile = <ProfileModel>[].obs;

  @override
  void onInit() {
    fetchProfileListTile();
    super.onInit();
  }

  Future<void> fetchProfileListTile() async {
    profileListTile.assignAll(demoProfileList);
  }
}
