import 'dart:developer';

import 'package:eduwise/src/data/services/secure_storage_service.dart';
import 'package:eduwise/src/presentation/screens/Auth/login/login.dart';
import 'package:eduwise/src/presentation/screens/navigation_screen.dart';
import 'package:get/get.dart';

class AppStartupController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkToken();
  }

  Future<void> checkToken() async {
    try {
      final acctoken = await StorageService.getAccessToken();
      final refreshtoken = await StorageService.getRefreshToken();

      if (acctoken != null && refreshtoken != null) {
        Get.offAll(() => NavigationScreen());
      } else {
        Get.offAll(() => LoginAuth());
      }
    } catch (e) {
      log("⚠️ error in checktoken():$e");
      Get.offAll(() => LoginAuth());
    }
  }
}
