import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../common/common.dart';
import '../../../utils/utils.dart';

class TopProviderRepository extends GetxController {
  static TopProviderRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get All TopServiceProvider
  Future<List<ProviderModel>> getTopProviders() async {
    try {
      final snapshot = await _db.collection('Providers').get();
      return snapshot.docs
          .map((document) => ProviderModel.fromSnapshot(document))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseExceptions(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  /// Get Provider Details from Cloud Firebase
  Future<ProviderModel> fetchProviderDetails(String id) async {
    try {
      final documentSnapshot = await _db.collection('Providers').doc(id).get();
      if (documentSnapshot.exists) {
        return ProviderModel.fromSnapshot(documentSnapshot);
      } else {
        return ProviderModel.empty();
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
