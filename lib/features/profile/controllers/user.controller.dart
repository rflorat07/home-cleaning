import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../common/common.dart';
import '../../../data/repositories/authentication/authentication.repository.dart';
import '../../../data/repositories/user/user_repository.dart';
import '../../../utils/utils.dart';
import '../../authentication/controllers/network/network_manager.dart';
import '../../authentication/screens/login/login.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  Rx<UserModel> user = UserModel.empty().obs;
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  final profileLoading = false.obs;
  final hidePassword = false.obs;
  final imageUploading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final _userRepository = Get.put(UserRepository());

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  // Fetch user
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await _userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  // save user record with any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      // First Update Rx User and then chech if user data is already stored. If not store new data
      await fetchUserRecord();

      if (user.value.id.isEmpty) {
        if (userCredential != null) {
          // Map Data
          final user = UserModel(
            id: userCredential.user!.uid,
            name: userCredential.user!.displayName ?? '',
            email: userCredential.user!.email ?? '',
            phoneNumber: userCredential.user!.phoneNumber ?? '',
            profilePicture: userCredential.user!.photoURL ?? '',
            gender: '',
          );

          // save user Data
          await _userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      TLoaders.warningSnackBar(
          title: 'Data not saved',
          message:
              'Something went wrong while saving your information. You can re-save your data in your Profile.');
    }
  }

  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(TSizes.size16),
      title: 'Delete Account',
      middleText:
          'Are you sure you want to delete your account permanently? This action is not reversible and all of your data will be removed permanently.',
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            side: const BorderSide(color: Colors.red)),
        child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
            child: Text('Delete')),
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: const Text('Cancel'),
      ),
    );
  }

  // Delete User Account
  void deleteUserAccount() async {
    try {
      TFullScreenLoader.openLoadingDialog();
      // First re-authenticate user
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;

      if (provider.isNotEmpty) {
        // Re Verify Auth Email
        if (provider == 'password') {
          await auth.deleteAccount();
          TFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        }
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// -- Re-Authenticate before deleting
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      // Star Loading
      TFullScreenLoader.openLoadingDialog();

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!reAuthFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
              verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Redirect
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      // Remove Loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// Upload Profile Image
  Future<void> uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
        maxHeight: 512,
        maxWidth: 512,
      );
      if (image != null) {
        imageUploading.value = true;
        // Upload Image
        final imageUrl =
            await _userRepository.uploadImage('Users/Images/Profile', image);

        // Update User Image Record
        Map<String, dynamic> json = {'ProfilePicture': imageUrl};
        await _userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        user.refresh();
        TLoaders.successSnackBar(
            title: 'Congratulations',
            message: 'Your Profile Image has been updated!');
      }
    } catch (e) {
      TLoaders.errorSnackBar(
          title: 'Oh Snap!', message: 'Something went wrong: $e');
    } finally {
      imageUploading.value = false;
    }
  }
}
