import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controller/Onboard/onboard_controller.dart';
import '../../widgets/button_two.dart';

class OnboardPage extends StatelessWidget {
  const OnboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: PageView.builder(
          controller: controller.pageController,
          onPageChanged: controller.updatePage,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.pages.length,
          itemBuilder: (context, index) {
            final page = controller.pages[index];

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 80),

                  Image.asset(page["image"]!, height: 400),

                  const SizedBox(height: 10),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      page["title"]!,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontFamily: 'Mooxy',
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    page["description"]!,
                    textAlign: TextAlign.start,
                    style: GoogleFonts.urbanist(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),

                  const Spacer(),

                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        controller.pages.length,
                        (dotIndex) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: controller.currentPage.value == dotIndex
                              ? 16
                              : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: controller.currentPage.value == dotIndex
                                ? const Color(0xFF8066FF)
                                : Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // 🚀 Common ButtonTwo
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: Obx(
                      () => ButtonTwo(
                        title: controller
                            .pages[controller.currentPage.value]["button"]!,
                        onTap: controller.nextPage,
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
