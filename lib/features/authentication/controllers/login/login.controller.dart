import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../navigation/screens/navigation_menu.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final hidePassword = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  /// -- Email and password Sign in
  Future<void> emailAndPasswordSignIn() async {
    Get.offAll(() => const NavigationMenu());
  }
}
