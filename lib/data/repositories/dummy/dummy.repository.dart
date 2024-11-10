import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';

class DummyRepository extends GetxController {
  static DummyRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Upload Dummy Data to Cloud Firebase
  Future<void> uploadDummyData(String filePath, String collection) async {
    try {
      Map<String, dynamic> jsonData = await readJsonFromFilePath(filePath);
      // Loop through each
      for (var item in jsonData['result']) {
        // Store in Firestore
        await _db.collection(collection).doc().set(item);
      }
    } on FirebaseException catch (e) {
      throw TFirebaseExceptions(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  Future<Map<String, dynamic>> readJsonFromFilePath(String filePath) async {
    String jsonString = await File(filePath).readAsString();
    return jsonDecode(jsonString);
  }

  Future<List<Map<String, dynamic>>> loadJsonFromAssets(String filePath) async {
    String jsonString = await rootBundle.loadString(filePath);
    return jsonDecode(jsonString);
  }
}
