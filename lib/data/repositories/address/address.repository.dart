import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../features/profile/models/address.model.dart';
import '../../../utils/utils.dart';

class AddressRepository extends GetxController {
  static AddressRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get all Address
  Future<List<AddressModel>> getAllAddress() async {
    try {
      final snapshot = await _db.collection('Addresses').get();
      final list = snapshot.docs
          .map((document) => AddressModel.fromSnapshot(document))
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
