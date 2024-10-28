import 'dart:async';
import 'dart:developer' as developer;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../common/common.dart';

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  final RxList<ConnectivityResult> _connectionStatus =
      [ConnectivityResult.none].obs;

  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<bool> isConnected() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      final connectivityResult = await _connectivity.checkConnectivity();
      return !(connectivityResult.contains(ConnectivityResult.none));
    } on PlatformException catch (e) {
      developer.log('Couldn\'t check connectivity status', error: e);
      return false;
    }
  }

  Future<void> _updateConnectionStatus(
      List<ConnectivityResult> connectivityResult) async {
    _connectionStatus.value = connectivityResult;
    if (connectivityResult.contains(ConnectivityResult.none)) {
      TLoaders.warningSnackBar(title: 'No Internet Connection');
    }
  }

  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();
  }
}
