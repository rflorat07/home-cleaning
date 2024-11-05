import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../common/models/popular_service.model.dart';
import '../../../utils/utils.dart';

class PopularServicesRepository extends GetxController {
  static PopularServicesRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get All PopularServices
  Future<List<PopularServiceModel>> getAllPopularServices() async {
    try {
      final snapshot = await _db.collection('Services').get();
      return snapshot.docs
          .map((document) => PopularServiceModel.fromSnapshot(document))
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
  Future<List<PopularServiceModel>> getAllBookmarkPopularServices() async {
    try {
      final snapshot = await _db
          .collection('Services')
          .where('isBookmark', isEqualTo: true)
          .get();
      return snapshot.docs
          .map((document) => PopularServiceModel.fromSnapshot(document))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseExceptions(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  /// Remove Bookmark from service
  Future<void> removeFromFavorites(Map<String, dynamic> json) async {
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

  /// Upload Dummy Data to Cloud Firebase
  Future<void> uploadDummyData(List<PopularServiceModel> items) async {
    try {
      // Loop through each
      for (var item in items) {
        // Store in Firestore
        await _db.collection('Services').doc(item.id).set(item.toJson());
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
