import 'package:eduwise/src/presentation/screens/Onboarding/onboard_page.dart';
import 'package:eduwise/src/presentation/screens/navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class Eduwise extends StatelessWidget {
  const Eduwise({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Eduwise',
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      // home: Splash(),
      home: NavigationScreen(),
    );
  }
}
