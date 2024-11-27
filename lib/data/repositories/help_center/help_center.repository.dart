import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../features/profile/screens/help_center/models/help_center.model.dart';
import '../../../utils/utils.dart';

class HelpCenterRepository extends GetxController {
  static HelpCenterRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get all Help Center
  Future<List<HelpCenterModel>> getAllHelpCenter() async {
    try {
      final snapshot = await _db.collection('HelpCenter').get();
      final list = snapshot.docs
          .map((document) => HelpCenterModel.fromSnapshot(document))
          .toList();

      return list;
    } on FirebaseException catch (e) {
      throw TFirebaseExceptions(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  /// Get all Contact Us
  Future<List<HelpCenterModel>> getAllContactUs() async {
    try {
      final snapshot = await _db.collection('ContactUs').get();
      final list = snapshot.docs
          .map((document) => HelpCenterModel.fromSnapshot(document))
          .toList();

      return list;
    } on FirebaseException catch (e) {
      throw TFirebaseExceptions(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }
}
