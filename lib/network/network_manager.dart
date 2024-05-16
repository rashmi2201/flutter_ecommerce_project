import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce_project/utlis/popups/loaders.dart';
import 'package:get/get.dart';

//Manages the network connectivity status and provides methods to check handle connectivity changes.
class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();
  
  
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>>
      _connectivitySubscription; //list
  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription = _connectivity.onConnectivityChanged
        .listen((List<ConnectivityResult> event) {
     
      _updateConnectionStatus(event.first);
    });
  }
  // Call _updateConnectionStatus with the first item in the list
  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    _connectionStatus.value = result;
    if (_connectionStatus.value == ConnectivityResult.none) {
      TLoaders.customToast(message: 'No Internet Connection');
    }
  }

  Future<bool> isConnected() async {
    // return true;
    try {
      final result = await _connectivity.checkConnectivity();
      return result != ConnectivityResult.none;
    } on PlatformException catch (_) {
      return false;
    }
  }

  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();
  }
}
