import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../common/common.dart';
import '../../../utils/utils.dart';

class ServicesRepository extends GetxController {
  static ServicesRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get All PopularServices
  Future<List<ServiceModel>> getAllPopularServices() async {
    try {
      final snapshot = await _db.collection('Services').get();
      return snapshot.docs
          .map((document) => ServiceModel.fromSnapshot(document))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseExceptions(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  /// Get All Bookmark PopularServices
  Future<List<ServiceModel>> getAllBookmarkPopularServices() async {
    try {
      final snapshot = await _db
          .collection('Services')
          .where('isBookmark', isEqualTo: true)
          .get();
      return snapshot.docs
          .map((document) => ServiceModel.fromSnapshot(document))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseExceptions(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  /// Remove/Add Bookmark from service
  Future<void> updateBookmarks(Map<String, dynamic> json) async {
    try {
      await _db.collection('Services').doc(json['id']).update(json);
    } on FirebaseException catch (e) {
      throw TFirebaseExceptions(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  /// Get Service Details from Cloud Firebase
  Future<ServiceModel> fetchServiceDetails(String id) async {
    try {
      final documentSnapshot = await _db.collection('Services').doc(id).get();
      if (documentSnapshot.exists) {
        return ServiceModel.fromSnapshot(documentSnapshot);
      } else {
        return ServiceModel.empty();
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
