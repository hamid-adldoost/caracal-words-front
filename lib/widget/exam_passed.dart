import 'package:flutter/material.dart';

class ExamPassedWidget extends StatelessWidget {
  const ExamPassedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text(
        'Exam Finished',
        style: TextStyle(
          fontSize: 50,
        ),
      ),
    );
  }
}
