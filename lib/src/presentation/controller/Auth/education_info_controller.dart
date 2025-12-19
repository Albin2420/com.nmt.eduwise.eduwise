import 'package:get/get.dart';

class EducationInfoController extends GetxController {
  // ================= SELECTED VALUES =================

  final selectedDegree = ''.obs;
  final selectedUniversity = ''.obs;
  final selectedCourse = ''.obs;
  final selectedScheme = ''.obs;
  final selectedSemester = ''.obs;

  // ================= DROPDOWN DATA =================

  final degrees = ['ACCA', 'BTech', 'B.com', 'BCA', 'BSc', 'BVoc', 'CA'];

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

  final schemes = ['2019 Scheme', '2020 Scheme', '2021 Scheme', '2022 Scheme'];

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

  // ================= VALIDATION =================

  bool get isFormComplete =>
      selectedDegree.value.isNotEmpty &&
      selectedUniversity.value.isNotEmpty &&
      selectedCourse.value.isNotEmpty &&
      selectedScheme.value.isNotEmpty &&
      selectedSemester.value.isNotEmpty;

  void clearSelections() {
    selectedDegree.value = '';
    selectedUniversity.value = '';
    selectedCourse.value = '';
    selectedScheme.value = '';
    selectedSemester.value = '';
  }
}
