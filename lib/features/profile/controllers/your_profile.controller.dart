import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/common.dart';
import '../../../data/repositories/user/user_repository.dart';
import '../../../utils/utils.dart';
import '../../authentication/controllers/network/network_manager.dart';
import 'user.controller.dart';

class YourProfileController extends GetxController {
  static YourProfileController get instance => Get.find();

  RxString gender = ''.obs;
  final name = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  final List<String> genders = ['Male', 'Female', 'Others'];

  GlobalKey<FormState> yourProfileFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializedNames();
    super.onInit();
  }

  Future<void> initializedNames() async {
    name.text = userController.user.value.name;
    email.text = userController.user.value.email;
    gender.value = userController.user.value.gender ?? '';
    phoneNumber.text = userController.user.value.phoneNumber ?? '';
  }

  Future<void> updateProfile() async {
    try {
      if (!yourProfileFormKey.currentState!.validate()) return;

      // Star Loading
      TFullScreenLoader.openLoadingDialog();

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Update profile in the Firebase Firestore
      Map<String, dynamic> profile = {
        'Name': name.text.trim(),
        'Email': email.text.trim(),
        'Gender': gender.value,
        'ProfilePicture': '',
        'PhoneNumber': phoneNumber.text,
      };

      await userRepository.updateSingleField(profile);

      await userController.fetchUserRecord();

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show Success Screen
      TLoaders.successSnackBar(
          title: 'Congratulations', message: 'Your Profile has been update.');
    } catch (e) {
      // Remove Loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
