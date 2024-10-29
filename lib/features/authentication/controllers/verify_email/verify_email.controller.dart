import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../common/common.dart';
import '../../../../data/repositories/authentication/authentication.repository.dart';
import '../../../../utils/utils.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  final _authenticationRepository = AuthenticationRepository.instance;

  /// --  Send Email Whenever verify Screen appears & Set Timer fot auto redirect.
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    checkEmailVerificationStatus();
    super.onInit();
  }

  /// Send Email verification Link
  sendEmailVerification() async {
    try {
      await _authenticationRepository.sendEmailVerification();
      TLoaders.successSnackBar(
          title: TTexts.emailSent, message: TTexts.checkEmail);
    } catch (e) {
      TLoaders.errorSnackBar(title: TTexts.ohSnap, message: e.toString());
    }
  }

  /// Time to automatically redirect on Email Verification
  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        await Get.off(() => SuccessScreen(
            title: TTexts.congratulation,
            subTitle: TTexts.yourAccountCreatedSubTitle,
            onPressed: () =>
                AuthenticationRepository.instance.screenRedirect()));
      }
    });
  }

  /// Manually check if Email Verified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => SuccessScreen(
          title: TTexts.congratulation,
          subTitle: TTexts.yourAccountCreatedSubTitle,
          onPressed: () => AuthenticationRepository.instance.screenRedirect()));
    }
  }
}
