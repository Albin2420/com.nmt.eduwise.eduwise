import 'package:eduwise/src/presentation/controller/Home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets/calendar_widget.dart';
import 'widgets/subject_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController ctrl = Get.find<HomeController>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),

            Row(
              children: [
                const CircleAvatar(
                  radius: 29,
                  backgroundImage: AssetImage('assets/images/john.png'),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Hello, John Doe',
                      style: const TextStyle(
                        fontFamily: 'Mooxy',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF444444),
                      ),
                    ),
                    Text(
                      'Today 18 Nov',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        color: const Color(0XFF444444),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 40),

            Container(
              height: 130,
              decoration: BoxDecoration(
                color: const Color(0xFF909AFF),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    right: -5,
                    top: -50,
                    child: Image.asset(
                      'assets/images/questionpaper.png',
                      height: 170,
                    ),
                  ),
                  Positioned(
                    left: 20,
                    bottom: 25,
                    right: 140,
                    child: Text(
                      'New Question Papers and Exam Updates for 2025 Batch',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            const CalendarWidget(),
            const SizedBox(height: 20),

            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                SubjectCard(
                  color: ctrl.getColor(0),
                  image: ctrl.getImage(0),
                  title: 'Programming in Python',
                  description:
                      'Python is a high-level, interpreted programming language known for its simplicity.',
                  onTap: () => ctrl.fetchDetails(),
                  creditno: 5,
                ),
                SubjectCard(
                  color: ctrl.getColor(1),
                  image: ctrl.getImage(1),
                  title: 'Database Management Systems',
                  description:
                      'DBMS provides efficient data management and querying capabilities.',
                  onTap: () => ctrl.fetchDetails(),
                  creditno: 5,
                ),
                SubjectCard(
                  color: ctrl.getColor(2),
                  image: ctrl.getImage(2),
                  title: 'Operating Systems',
                  description:
                      'An OS manages computer hardware and software resources.',
                  onTap: () => ctrl.fetchDetails(),
                  creditno: 4,
                ),
                SubjectCard(
                  color: ctrl.getColor(3),
                  image: ctrl.getImage(3),
                  title: 'Data Structures',
                  description:
                      'Essential for efficient algorithms and memory optimization.',
                  onTap: () => ctrl.fetchDetails(),
                  creditno: 5,
                ),
                SubjectCard(
                  color: ctrl.getColor(4),
                  image: ctrl.getImage(4),
                  title: 'Computer Networks',
                  description: 'Learn how data is transmitted between systems.',
                  onTap: () => ctrl.fetchDetails(),
                  creditno: 5,
                ),
                SubjectCard(
                  color: ctrl.getColor(5),
                  image: ctrl.getImage(5),
                  title: 'Machine Learning Basics',
                  description:
                      'Algorithms that enable systems to learn patterns.',
                  onTap: () => ctrl.fetchDetails(),
                  creditno: 5,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
