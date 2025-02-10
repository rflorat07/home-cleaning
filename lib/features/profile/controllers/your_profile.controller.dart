import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/common.dart';
import '../../../data/repositories/user/user.repository.dart';
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
      TFullScreenLoader.openLoadingDialog(null);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading(null);
        return;
      }

      // Update profile in the Firebase Firestore
      Map<String, dynamic> profile = {
        'Name': name.text.trim(),
        'Email': email.text.trim(),
        'Gender': gender.value,
        'PhoneNumber': phoneNumber.text,
        'ProfilePicture': userController.user.value.profilePicture,
      };

      await userRepository.updateSingleField(profile);

      await userController.fetchUserRecord();

      // Remove Loader
      TFullScreenLoader.stopLoading(null);

      // Show Success Screen
      TLoaders.successSnackBar(
          title: 'Congratulations', message: 'Your Profile has been update.');
    } catch (e) {
      // Remove Loader
      TFullScreenLoader.stopLoading(null);
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
