import 'package:caracal_words/widget/word_exam_unit_widget.dart';
import 'package:flutter/material.dart';

class WordExamUnit extends StatelessWidget {
  const WordExamUnit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Word Exam',
        ),
      ),
      body: const WordExamUnitWidget(),
    );
  }
}
