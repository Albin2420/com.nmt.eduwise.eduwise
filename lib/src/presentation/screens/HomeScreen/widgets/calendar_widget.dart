import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../controller/Home/home_controller.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    return Obx(() {
      final weekDates = controller.currentWeekDates;
      final today = controller.selectedDate.value;

      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(weekDates.length, (index) {
          final date = weekDates[index];

          final bool isToday =
              date.day == today.day &&
                  date.month == today.month &&
                  date.year == today.year;

          return Container(
            width: 45,
            height: 60,
            decoration: BoxDecoration(
              color: isToday ? const Color(0xFF8066FF) : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  controller.formatDate(date),
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: isToday ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  controller.formatDay(date),
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color:
                    isToday ? Colors.white : Colors.grey.shade500,
                  ),
                ),
              ],
            ),
          );
        }),
      );
    });
  }
}
