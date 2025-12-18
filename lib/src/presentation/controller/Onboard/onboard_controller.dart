import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../screens/navigation_screen.dart';

class OnboardController extends GetxController {
  final PageController pageController = PageController();
  final currentPage = 0.obs;

  final List<Map<String, String>> pages = [
    {
      "image": "assets/images/onboard1.png",
      "title": "Welcome to Exam Partner",
      "description":
          "Every late night you study, every challenge you overcome, and every small step you take today is shaping the version of you that will one day inspire others.",
      "button": "Next",
    },
    {
      "image": "assets/images/onboard2.png",
      "title": "Practise & Improve",
      "description":
          "Strengthen your knowledge through engaging quizzes, repeated practice, and guided revision. Master every chapter with confidence as you correct mistakes and improve continuously.",
      "button": "Next",
    },
    {
      "image": "assets/images/onboard3.png",
      "title": "Personalized for You",
      "description":
          "Experience a learning path tailored to your pace, strengths, and goals. Get recommendations that adapt to the way you understand and absorb information.",
      "button": "Let’s Go",
    },
  ];

  void nextPage() {
    if (currentPage.value < pages.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
      currentPage.value++;
    } else {
      Get.to(() => const NavigationScreen());
    }
  }

  void updatePage(int index) {
    currentPage.value = index;
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
