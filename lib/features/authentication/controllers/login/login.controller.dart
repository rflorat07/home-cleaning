import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final hidePassword = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  /// -- Email and password Sign in
  Future<void> emailAndPasswordSignIn() async {}
}
