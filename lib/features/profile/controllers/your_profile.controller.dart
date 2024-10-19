import 'package:flutter/material.dart';
import 'package:get/get.dart';

class YourProfileController extends GetxController {
  static YourProfileController get instance => Get.find();

  final name = TextEditingController();
  final email = TextEditingController();
  final gender = TextEditingController();
  final phoneNumber = TextEditingController();
  final List<String> genders = ['Male', 'Female', 'Others'];

  GlobalKey<FormState> yourProfileFormKey = GlobalKey<FormState>();
}
