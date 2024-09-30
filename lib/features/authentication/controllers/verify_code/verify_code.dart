import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyCodeController {
  static VerifyCodeController get instance => Get.find();

  final code = TextEditingController();
  GlobalKey<FormState> verifyCodeFormKey = GlobalKey<FormState>();

  /// -- Send code to verify
  Future<void> sendCodeToVerify() async {}
}
