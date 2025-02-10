import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/common.dart';
import '../../../../data/repositories/authentication/authentication.repository.dart';
import '../../../../data/repositories/user/user.repository.dart';
import '../../../../utils/utils.dart';
import '../../screens/verify_email/verify_email.dart';
import '../network/network_manager.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final hidePassword = true.obs;
  final privacyPolicy = true.obs;

  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /// -- Email and password Sign in
  Future<void> emailAndPasswordSignIn() async {}

  Future<void> signup() async {
    try {
      // Form Validation
      if (!signupFormKey.currentState!.validate()) return;

      // Privacy Policy Check
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
            title: TTexts.acceptPrivacyPolicy,
            message: TTexts.acceptPrivacyPolicyMessage);
        return;
      }

      // Start Loading
      TFullScreenLoader.openLoadingDialog(null);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading(null);
        return;
      }

      // Register user in the Firebase Authentication & save user data in the Firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      // Save authenticated user data in the Firebase Firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        name: name.text.trim(),
        email: email.text.trim(),
        gender: '',
        phoneNumber: '',
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      TFullScreenLoader.stopLoading(null);

      // Show Success Message
      TLoaders.successSnackBar(
        title: TTexts.congratulation,
        message: TTexts.congratulationMessage,
      );

      // Move to verify email Screen
      await Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      // Show some Generic error to the user
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      TFullScreenLoader.stopLoading(null);
    }
  }
}
