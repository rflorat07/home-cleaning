import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../common/common.dart';
import '../../../../data/repositories/authentication/authentication.repository.dart';
import '../../../../utils/utils.dart';
import '../../../navigation/screens/navigation_menu.dart';
import '../network/network_manager.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final rememberMe = true.obs;
  final hidePassword = true.obs;

  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initRememberMe();
    super.onInit();
  }

  /// -- Email and password Sign in
  Future<void> emailAndPasswordSignIn() async {
    try {
      if (!loginFormKey.currentState!.validate()) return;

      // Remember me Check
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_CHECK', true);
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      } else {
        localStorage.remove('REMEMBER_ME_CHECK');
        localStorage.remove('REMEMBER_ME_EMAIL');
        localStorage.remove('REMEMBER_ME_PASSWORD');
      }

      //Start Loading
      TFullScreenLoader.openLoadingDialog();

      // check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Login user using Email and password authentication
      await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // redirect
      AuthenticationRepository.instance.screenRedirect();

      Get.offAll(() => const NavigationMenu());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  void initRememberMe() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    rememberMe.value = localStorage.read('REMEMBER_ME_CHECK') ?? false;
  }
}
