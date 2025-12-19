import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionController extends GetxController {
  /// -------------------- STATE --------------------

  // Selected subject from QuestionPage
  final selectedSubject = ''.obs;

  // Filter UI state
  final isFilterOpen = false.obs;

  // Filter selections
  final selectedMonth = ''.obs;
  final selectedYear = ''.obs;
  final selectedType = ''.obs;

  // Question papers data
  final questionPapers = <QuestionPaperItem>[].obs;

  /// -------------------- UI STYLE CONFIG --------------------

  // Color & image config for subject cards
  final Map<String, QuestionStyle> questionStyles = {
    "Python": QuestionStyle(
      color: const Color(0xFF6499DF),
      image: "assets/images/blue_r.png",
    ),
    "Java": QuestionStyle(
      color: const Color(0xFFCB97FF),
      image: "assets/images/purple_r.png",
    ),
    "C++": QuestionStyle(
      color: const Color(0xFFFFBB00),
      image: "assets/images/light_orange_r.png",
    ),
    "HTML": QuestionStyle(
      color: const Color(0xFFFF4C30),
      image: "assets/images/red_orange_r.png",
    ),
    "React": QuestionStyle(
      color: const Color(0xFF5DCE1C),
      image: "assets/images/green_r.png",
    ),
    "Flutter": QuestionStyle(
      color: const Color(0xFFDF64B2),
      image: "assets/images/pink_r.png",
    ),
  };

  /// -------------------- LIFECYCLE --------------------

  @override
  void onInit() {
    super.onInit();
    loadQuestionPapers();
    isFilterOpen.value = false;
  }

  /// -------------------- DATA LOADING --------------------

  void loadQuestionPapers() {
    // Sample data – replace with API later
    questionPapers.value = [
      QuestionPaperItem(
        title: "Question Paper",
        type: "Regular",
        month: "March",
        year: "2025",
      ),
      QuestionPaperItem(
        title: "Question Paper",
        type: "Regular",
        month: "March",
        year: "2025",
      ),
      QuestionPaperItem(
        title: "Question Paper",
        type: "Supplementary",
        month: "March",
        year: "2025",
      ),
      QuestionPaperItem(
        title: "Question Paper",
        type: "Regular",
        month: "February",
        year: "2025",
      ),
      QuestionPaperItem(
        title: "Question Paper",
        type: "Regular",
        month: "January",
        year: "2025",
      ),
      QuestionPaperItem(
        title: "Question Paper",
        type: "Supplementary",
        month: "December",
        year: "2024",
      ),
      QuestionPaperItem(
        title: "Question Paper",
        type: "Regular",
        month: "November",
        year: "2024",
      ),
      QuestionPaperItem(
        title: "Question Paper",
        type: "Supplementary",
        month: "October",
        year: "2024",
      ),
      QuestionPaperItem(
        title: "Question Paper",
        type: "Regular",
        month: "September",
        year: "2024",
      ),
    ];
  }

  /// -------------------- SUBJECT --------------------

  void setSubject(String subject) {
    selectedSubject.value = subject;
  }

  /// -------------------- FILTER UI CONTROL --------------------

  void toggleFilter() {
    isFilterOpen.value = !isFilterOpen.value;
  }

  void openFilter() {
    isFilterOpen.value = true;
  }

  void closeFilter() {
    isFilterOpen.value = false;
  }

  /// -------------------- FILTER OPTIONS --------------------

  // Unique months (sorted in calendar order)
  List<String> getAvailableMonths() {
    final months =
    questionPapers.map((paper) => paper.month).toSet().toList();

    const monthOrder = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];

    months.sort(
          (a, b) => monthOrder.indexOf(a).compareTo(monthOrder.indexOf(b)),
    );

    return months;
  }

  // Unique years (descending)
  List<String> getAvailableYears() {
    final years =
    questionPapers.map((paper) => paper.year).toSet().toList();

    years.sort((a, b) => b.compareTo(a));
    return years;
  }

  // Unique types
  List<String> getAvailableTypes() {
    return questionPapers.map((paper) => paper.type).toSet().toList();
  }

  /// -------------------- FILTER SETTERS --------------------

  void setMonth(String month) {
    selectedMonth.value = month;
  }

  void setYear(String year) {
    selectedYear.value = year;
  }

  void setType(String type) {
    selectedType.value = type;
  }

  /// -------------------- FILTER LOGIC --------------------

  List<QuestionPaperItem> getFilteredPapers() {
    if (!hasActiveFilters()) {
      return questionPapers;
    }

    return questionPapers.where((paper) {
      final matchesMonth =
          selectedMonth.value.isEmpty || paper.month == selectedMonth.value;
      final matchesYear =
          selectedYear.value.isEmpty || paper.year == selectedYear.value;
      final matchesType =
          selectedType.value.isEmpty || paper.type == selectedType.value;

      return matchesMonth && matchesYear && matchesType;
    }).toList();
  }

  void applyFilters() {
    // Trigger UI refresh
    questionPapers.refresh();
  }

  void clearFilters() {
    selectedMonth.value = '';
    selectedYear.value = '';
    selectedType.value = '';
  }

  bool hasActiveFilters() {
    return selectedMonth.value.isNotEmpty ||
        selectedYear.value.isNotEmpty ||
        selectedType.value.isNotEmpty;
  }
}

/// -------------------- MODELS --------------------

class QuestionStyle {
  final Color color;
  final String image;

  const QuestionStyle({
    required this.color,
    required this.image,
  });
}

class QuestionPaperItem {
  final String title;
  final String type;
  final String month;
  final String year;

  const QuestionPaperItem({
    required this.title,
    required this.type,
    required this.month,
    required this.year,
  });
}
