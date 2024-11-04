import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../common/common.dart';
import '../../../utils/utils.dart';

class TopServiceProviderRepository extends GetxController {
  static TopServiceProviderRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get All TopServiceProvider
  Future<List<TopServiceModel>> getAllTopService() async {
    try {
      final snapshot = await _db.collection('Providers').get();
      return snapshot.docs
          .map((document) => TopServiceModel.fromSnapshot(document))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseExceptions(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  /// Upload Dummy Data to Cloud Firebase
  Future<void> uploadDummyData(List<TopServiceModel> items) async {
    try {
      // Loop through each
      for (var item in items) {
        // Store in Firestore
        await _db.collection('Providers').doc(item.id).set(item.toJson());
      }
    } on FirebaseException catch (e) {
      throw TFirebaseExceptions(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }
}
