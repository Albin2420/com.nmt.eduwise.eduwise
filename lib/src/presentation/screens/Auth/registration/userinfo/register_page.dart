import 'package:eduwise/src/presentation/screens/Auth/registration/userinfo/widgets/build_label.dart';
import 'package:eduwise/src/presentation/screens/Auth/registration/userinfo/widgets/custom_textfield.dart';
import 'package:eduwise/src/presentation/widgets/button_one.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/Auth/authentication_controller.dart';
import 'otp_info.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthenticationController>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back(); // ⬅️ go back
                      },
                      child: Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          size: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(width: 25),
                    Column(
                      children: const [
                        SizedBox(height: 5),
                        Text(
                          "Register",
                          style: TextStyle(
                            fontFamily: 'Mooxy',
                            fontSize: 32,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                Padding(
                  padding: const EdgeInsets.only(left: 22),
                  child: const LabelWidget(text: "Email"),
                ),
                Obx(
                  () => CustomTextField(
                    hintText: "Enter your email",
                    controller: controller.emailController,
                    focusNode: controller.emailFocus,
                    borderColor: controller.emailFocusState.value
                        ? controller.activeColor
                        : Colors.transparent,
                  ),
                ),

                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 22),
                  child: const LabelWidget(text: "First Name"),
                ),
                Obx(
                  () => CustomTextField(
                    hintText: "Enter your first name",
                    controller: controller.firstNameController,
                    focusNode: controller.firstFocus,
                    borderColor: controller.firstFocusState.value
                        ? controller.activeColor
                        : Colors.transparent,
                  ),
                ),

                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 22),
                  child: const LabelWidget(text: "Last Name"),
                ),
                Obx(
                  () => CustomTextField(
                    hintText: "Enter your last name",
                    controller: controller.lastNameController,
                    focusNode: controller.lastFocus,
                    borderColor: controller.lastFocusState.value
                        ? controller.activeColor
                        : Colors.transparent,
                  ),
                ),

                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 22),
                  child: const LabelWidget(text: "Phone Number"),
                ),
                Obx(
                  () => CustomTextField(
                    hintText: "Eg. 9017271218",
                    controller: controller.phoneController,
                    focusNode: controller.phoneFocus,
                    keyboardType: TextInputType.number,
                    isPhone: true,
                    borderColor: controller.phoneFocusState.value
                        ? controller.activeColor
                        : Colors.transparent,
                  ),
                ),

                const SizedBox(height: 40),
                ButtonOne(
                  title: "Register",
                  onTap: () {
                    Get.to(() => OtpInfo());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
