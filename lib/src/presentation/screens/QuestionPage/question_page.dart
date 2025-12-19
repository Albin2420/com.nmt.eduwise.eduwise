import 'package:eduwise/src/presentation/screens/QuestionPage/widgets/question_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/questionPage/question_controller.dart';
import 'Routepage/question_listed_page.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(QuestionController());

    // Manual subject + heading list
    final questionPapers = [
      QuestionPaperModel(
        title: "Python Question Paper",
        subject: "Python",
      ),
      QuestionPaperModel(
        title: "Java Question Paper",
        subject: "Java",
      ),
      QuestionPaperModel(
        title: "C++ Question Paper",
        subject: "C++",
      ),
      QuestionPaperModel(
        title: "HTML Question Paper",
        subject: "HTML",
      ),
      QuestionPaperModel(
        title: "React Question Paper",
        subject: "React",
      ),
      QuestionPaperModel(
        title: "Flutter Question Paper",
        subject: "Flutter",
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 16),
          child: Text(
            "Question Papers",
            style: TextStyle(
              fontFamily: 'Mooxy',
              fontSize: 28,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),

        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Column(
              children: questionPapers.map((paper) {
                final style =
                controller.questionStyles[paper.subject]!;

                return QuestionCard(
                  title: paper.title,
                  color: style.color,
                  image: style.image,
                  onTap: () {
                    controller.setSubject(paper.subject);
                    controller.closeFilter();
                    Get.to(() => const QuestionListedPage());
                  },
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
class QuestionPaperModel {
  final String title;
  final String subject;

  QuestionPaperModel({
    required this.title,
    required this.subject,
  });
}
