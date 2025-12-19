import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import '../../../controller/Auth/authentication_controller.dart';
import 'widgets/google_signin_button.dart';

class LoginAuth extends StatelessWidget {
  const LoginAuth({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthenticationController());
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bc_image.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 155),

            // Boy image
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.46,
              width: double.infinity,
              child: Image.asset('assets/images/boy.png', fit: BoxFit.contain),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 27),
              child: Text(
                "Hello,\nWelcome",
                style: const TextStyle(
                  fontFamily: 'Mooxy',
                  color: Colors.white,
                  fontSize: 63,
                  fontWeight: FontWeight.w500,
                  height: 1.2,
                ),
              ),
            ),

            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: GoogleSignInButton(),
            ),
          ],
        ),
      ),
    );
  }
}
