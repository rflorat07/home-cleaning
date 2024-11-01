import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/common.dart';
import '../../../../data/repositories/authentication/authentication.repository.dart';
import '../../../../utils/utils.dart';
import '../../screens/login/login.dart';
import '../network/network_manager.dart';

class ForgotPasswordController extends GetxController {
  static ForgotPasswordController get instance => Get.find();

  final email = TextEditingController();

  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();

  sendPasswordResetEmail() async {
    try {
      // Form Validation
      if (!forgotPasswordFormKey.currentState!.validate()) return;

      // Star Loading
      TFullScreenLoader.openLoadingDialog();

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Send Email to Reset Password
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show Success Screen
      TLoaders.successSnackBar(
          title: TTexts.emailSent, message: TTexts.emailSentReset);

      // Redirect
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      // Remove Loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
