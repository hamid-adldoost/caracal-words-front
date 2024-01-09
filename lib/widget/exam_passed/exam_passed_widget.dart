import 'package:caracal_words/widget/exam_passed/exam_passed_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExamPassedWidget extends GetView<ExamPassedController> {
  const ExamPassedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Text(
          'Exam Finished',
          style: TextStyle(
            fontSize: 50,
          ),
        ),
      ),
    );
  }
}
