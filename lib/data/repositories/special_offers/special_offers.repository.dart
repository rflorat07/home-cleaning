import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../common/common.dart';
import '../../../utils/utils.dart';

class SpecialOffersRepository extends GetxController {
  static SpecialOffersRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get all SpecialOffers
  Future<List<SpecialOfferModel>> getAllSpecialOffers() async {
    try {
      final snapshot = await _db.collection('Offers').get();
      return snapshot.docs
          .map((document) => SpecialOfferModel.fromSnapshot(document))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseExceptions(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  /// Upload SpecialOffers to the Cloud Firebase
  Future<void> uploadDummyData(List<SpecialOfferModel> items) async {
    try {
      // Loop through each
      for (var item in items) {
        // Store in Firestore
        await _db.collection('Offers').doc(item.id).set(item.toJson());
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
