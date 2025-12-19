import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../controller/Navigation/navigation_controller.dart';
import 'HomeScreen/home.dart';
import 'Notifications/notification_page.dart';
import 'Profile/profile_page.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final navController = Get.put(NavigationController());

    // icon asset paths
    final List<String> normalIcons = [
      'assets/images/home.png',
      'assets/images/bell.png',
      'assets/images/file.png',
      'assets/images/person.png',
    ];

    final List<String> activeIcons = [
      'assets/images/blue_home.png',
      'assets/images/blue_bell.png',
      'assets/images/blue_file.png',
      'assets/images/blue_person.png',
    ];

    return Obx(() {
      return Scaffold(
        backgroundColor: navController.selectedIndex.value == 1?Color(0xFF7B61FF):Colors.white,
        body: SafeArea(
          child: IndexedStack(
            index: navController.selectedIndex.value,
            children: const [
              Home(),
              NotificationPage(),
              // QuestionPage(),
              SizedBox(),
              ProfilePage(),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 70,
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(normalIcons.length, (index) {
              final bool isSelected =
                  navController.selectedIndex.value == index;

              return GestureDetector(
                onTap: () => navController.changeIndex(index: index),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 60,
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: isSelected
                        ? const Border(
                      top: BorderSide(
                        color: Color(0xFF2900EF),
                        width: 4,
                      ),
                    )
                        : null,
                  ),
                  child: Image.asset(
                    isSelected ? activeIcons[index] : normalIcons[index],
                    width: 28,
                    height: 28,
                    fit: BoxFit.contain,
                  ),
                ),
              );
            }),
          ),
        ),
      );
    });
  }
}
