import 'package:caracal_words/widget/word_source_exam/word_source_exam_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class WordExamChoiceWidget extends GetView<WordSourceExamController> {
  const WordExamChoiceWidget({
    super.key,
    required this.choiceValue,
  });

  final String choiceValue;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          controller.onChoiceSelected(choiceValue);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: controller.setChoiceColor(choiceValue),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      choiceValue,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.vazirmatn(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
