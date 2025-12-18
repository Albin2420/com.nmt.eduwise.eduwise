import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import '../../../../controller/Auth/authentication_controller.dart';
import '../../../../widgets/button_one.dart';
import '../educationinfo/educationifo.dart';

class OtpInfo extends StatelessWidget {
  const OtpInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthenticationController>();

    final defaultPinTheme = PinTheme(
      width: 50,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: Colors.black,
        fontFamily: 'Mooxy',
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🔙 Back Button
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
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
                    const Text(
                      "OTP Verification",
                      style: TextStyle(
                        fontFamily: 'Mooxy',
                        fontSize: 32,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                // 🖼️ Keyboy Image
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: Center(
                    child: Image.asset(
                      'assets/images/keyboy.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Enter the 6-digit code sent to your phone number",
                  style: TextStyle(color: Colors.black54, fontSize: 15),
                ),
                const SizedBox(height: 30),

                // 🔢 OTP Input (Pinput)
                Center(
                  child: Pinput(
                    length: 6,
                    controller: controller.otpController,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: defaultPinTheme.copyWith(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: controller.activeColor,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    submittedPinTheme: defaultPinTheme.copyWith(
                      decoration: BoxDecoration(
                        color: controller.activeColor.withOpacity(0.1),
                        border: Border.all(color: controller.activeColor),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onCompleted: (pin) {
                      debugPrint('OTP entered: $pin');
                    },
                  ),
                ),

                const SizedBox(height: 20),

                // 🔁 Resend text
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Resend OTP in 30s",
                    style: TextStyle(
                      color: controller.activeColor.withOpacity(0.8),
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // ✅ Verify Button
                Obx(
                  () => ButtonOne(
                    title: "Verify OTP",
                    onTap: controller.otpValid.value
                        ? () {
                            debugPrint("OTP: ${controller.getOtp()}");
                          }
                        : () {
                            Get.to(() => Educationifo());
                          },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
