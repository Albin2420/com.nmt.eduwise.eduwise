import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {


  // user info
  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final otpController = TextEditingController();

  // Focus Nodes
  final emailFocus = FocusNode();
  final firstFocus = FocusNode();
  final lastFocus = FocusNode();
  final phoneFocus = FocusNode();

  // Reactive Focus States
  final emailFocusState = false.obs;
  final firstFocusState = false.obs;
  final lastFocusState = false.obs;
  final phoneFocusState = false.obs;

  // Validation States
  final formValid = false.obs;
  final otpValid = false.obs;

  // Colors
  final Color activeColor = const Color(0xFF8066FF);
  final Color inactiveColor = Colors.grey.shade300;

  //education info

  var selectedDegree = ''.obs;
  var selectedUniversity = ''.obs;
  var selectedCourse = ''.obs;
  var selectedScheme = ''.obs;
  var selectedSemester = ''.obs;

  final degrees = [
    'ACCA',
    'BTech',
    'B.com',
    'Bca',
    'Bsc',
    'Bvoc',
    'CA',
  ];

  final universities = [
    'Adhishankara College',
    'Bharat Matha College',
    'Cochin University of Science & Tech',
    'Christ Engineering College Irinjalakuda',
    'Federal Institute of Science & Tech',
    'Rajagiri Institute of Science & Tech',
    'SCMS School of Engineering',
  ];

  final courses = [
    'Computer Science',
    'Electronics',
    'Mechanical',
    'Civil',
    'Electrical',
  ];

  final schemes = [
    '2019 Scheme',
    '2020 Scheme',
    '2021 Scheme',
    '2022 Scheme',
  ];

  final semesters = [
    'Semester 1',
    'Semester 2',
    'Semester 3',
    'Semester 4',
    'Semester 5',
    'Semester 6',
    'Semester 7',
    'Semester 8',
  ];


  @override
  void onInit() {
    super.onInit();
    _setupFocusListeners();
    _setupTextListeners();

    otpController.addListener(() {
      otpValid.value = otpController.text.length == 6;
    });
  }



  void _setupFocusListeners() {
    emailFocus.addListener(() => emailFocusState.value = emailFocus.hasFocus);
    firstFocus.addListener(() => firstFocusState.value = firstFocus.hasFocus);
    lastFocus.addListener(() => lastFocusState.value = lastFocus.hasFocus);
    phoneFocus.addListener(() => phoneFocusState.value = phoneFocus.hasFocus);
  }

  void _setupTextListeners() {
    emailController.addListener(_checkForm);
    firstNameController.addListener(_checkForm);
    lastNameController.addListener(_checkForm);
    phoneController.addListener(_checkForm);
  }

  void _checkForm() {
    final valid = emailController.text.isNotEmpty &&
        firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        RegExp(r'^[0-9]{10}$').hasMatch(phoneController.text);
    formValid.value = valid;
  }

  String getOtp() => otpController.text;


  @override
  void onClose() {
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    otpController.dispose();

    emailFocus.dispose();
    firstFocus.dispose();
    lastFocus.dispose();
    phoneFocus.dispose();
    super.onClose();
  }
}
