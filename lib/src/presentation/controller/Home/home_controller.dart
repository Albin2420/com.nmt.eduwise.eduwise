import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  // Always today
  final Rx<DateTime> selectedDate = DateTime.now().obs;

  Timer? _midnightTimer;

  final List<Map<String, dynamic>> subjectVisuals = [
    {'color': const Color(0xFF6499DF), 'image': 'assets/images/blue.png'},
    {'color': const Color(0xFFCB97FF), 'image': 'assets/images/pink.png'},
    {'color': const Color(0xFFFFBB00), 'image': 'assets/images/yellow.png'},
    {'color': const Color(0xFFFF4C30), 'image': 'assets/images/orange.png'},
    {'color': const Color(0xFF5DCE1C), 'image': 'assets/images/green.png'},
    {'color': const Color(0xFFDF64B2), 'image': 'assets/images/violet.png'},
  ];

  /// 🔹 Deterministic random index based on DATE
  int _dateBasedIndex(int index) {
    final daySeed = DateTime(
      selectedDate.value.year,
      selectedDate.value.month,
      selectedDate.value.day,
    ).millisecondsSinceEpoch;

    final random = Random(daySeed + index);
    return random.nextInt(subjectVisuals.length);
  }

  /// 🔹 Safe color getter
  Color getColor(int index) {
    if (index < subjectVisuals.length) {
      return subjectVisuals[index]['color'];
    }
    final safeIndex = _dateBasedIndex(index);
    return subjectVisuals[safeIndex]['color'];
  }

  /// 🔹 Safe image getter
  String getImage(int index) {
    if (index < subjectVisuals.length) {
      return subjectVisuals[index]['image'];
    }
    final safeIndex = _dateBasedIndex(index);
    return subjectVisuals[safeIndex]['image'];
  }

  /// 🔹 Tap does NOT change date
  void fetchDetails() {
    // navigation / api later
  }

  /// 🔹 Auto-shift date after 24 hours (midnight)
  void _scheduleMidnightUpdate() {
    final now = DateTime.now();
    final nextMidnight = DateTime(now.year, now.month, now.day + 1);

    final duration = nextMidnight.difference(now);

    _midnightTimer?.cancel();
    _midnightTimer = Timer(duration, () {
      selectedDate.value = DateTime.now();
      _scheduleMidnightUpdate(); // reschedule
    });
  }

  /// Calendar helpers (unchanged)
  List<DateTime> get currentWeekDates {
    DateTime now = selectedDate.value;
    DateTime monday = now.subtract(Duration(days: now.weekday - 1));
    return List.generate(7, (i) => monday.add(Duration(days: i)));
  }

  String formatDay(DateTime date) => DateFormat('E').format(date);
  String formatDate(DateTime date) => DateFormat('d').format(date);

  @override
  void onInit() {
    super.onInit();
    selectedDate.value = DateTime.now(); // force today
    _scheduleMidnightUpdate();
  }

  @override
  void onClose() {
    _midnightTimer?.cancel();
    super.onClose();
  }
}
