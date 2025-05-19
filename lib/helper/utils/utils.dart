import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Utils {

  static Future<bool> hasNetwork() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
          const SnackBar(
              content: Text('Please check internet')));
      // Utils.showError("Please check internet");
      return false;
    } else {
      return true;
    }
  }
}