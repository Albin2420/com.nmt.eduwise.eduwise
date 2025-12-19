import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  // User data
  var email = ''.obs;
  var firstName = ''.obs;
  var lastName = ''.obs;
  var phoneNumber = ''.obs;
  var profileImage = ''.obs;

  // Text editing controllers
  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();

  var focusedField = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }

  @override
  void onClose() {
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    super.onClose();
  }

  // Load initial user data
  void loadUserData() {
    emailController.text = email.value;
    firstNameController.text = firstName.value;
    lastNameController.text = lastName.value;
    phoneNumberController.text = phoneNumber.value;
  }

  // Save updated user data
  void saveChanges() {
    email.value = emailController.text;
    firstName.value = firstNameController.text;
    lastName.value = lastNameController.text;
    phoneNumber.value = phoneNumberController.text;

    debugPrint('✅ Profile updated successfully');
    Get.back();
  }

  // Pick profile image


  // Manage focus change
  void setFocusedField(String fieldName) {
    focusedField.value = fieldName;
  }

  void clearFocus() {
    focusedField.value = '';
  }

  // Logout confirmation
  void logout() {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text('Log out'),
        content: const Text('Are you sure you want to log out?'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Get.back();
              log('🚪 User logged out successfully');
            },
            child: const Text(
              'Log out',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  String get fullName => '${firstName.value} ${lastName.value}';
}
