import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final hidePassword = true.obs;
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /// -- Email and password Sign in
  Future<void> emailAndPasswordSignIn() async {}
}
