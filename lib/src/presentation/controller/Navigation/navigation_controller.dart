import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  var selectedIndex = 0.obs;

  void changeIndex({required int index}) {
    try {
      selectedIndex.value = index;
    } catch (e) {
      log("‼️ Error in goTo(): $e");
    }
  }
  Color get backgroundColor {
    if (selectedIndex.value == 1) {
      return const Color(0xFF7B61FF);
    } else if (selectedIndex.value == 2) {
      return const Color(0xFFF3F4FF);
    } else {
      return Colors.white;
    }
  }
}
