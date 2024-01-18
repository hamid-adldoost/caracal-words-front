import 'package:caracal_words/widget/exam_passed/exam_passed_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExamPassedWidget extends GetView<ExamPassedController> {
  const ExamPassedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('exam finished'),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                const Text(
                  'Exam Finished',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                ElevatedButton(
                  style: const ButtonStyle(
                    alignment: Alignment.center,
                  ),
                  onPressed: () {
                    controller.gotoExamPage();
                  },
                  child: const Text('Try another exam!'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
