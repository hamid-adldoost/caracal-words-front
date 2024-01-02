import 'package:caracal_words/provider/exam_unit_provider.dart';
import 'package:caracal_words/service/submit-exam-result.dart';
import 'package:caracal_words/service/word_exam_item_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WordExamChoice extends StatefulWidget {
  const WordExamChoice({
    super.key,
    required this.choiceValue,
  });

  final String choiceValue;

  @override
  State<WordExamChoice> createState() => _WordExamChoiceState();
}

class _WordExamChoiceState extends State<WordExamChoice> {
  late String correctValue;
  late int examUnitStatus;
  late WordExamItem examItem;
  final choiceModeValues = [
    0, //not choosen
    1, //choosen
    2, //wrong choosen
  ];
  // late int choiceMode;

  @override
  void initState() {
    super.initState();
  }

  Color setChoiceColor() {
    if (examUnitStatus == 0) {
      return Colors.grey;
    } else {
      if (widget.choiceValue == correctValue) {
        return Colors.lightGreen;
      } else if (widget.choiceValue ==
          context.read<ExamUnitProvider>().selectedChoiceValue) {
        return Colors.red;
      } else {
        return Colors.grey;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    examItem = context.watch<ExamUnitProvider>().examItem;
    examUnitStatus = context.watch<ExamUnitProvider>().examUnitStatus;
    correctValue =
        context.read<ExamUnitProvider>().examItem.destinationLanguageMeaning;

    return GestureDetector(
      onTap: () {
        if (context.read<ExamUnitProvider>().examUnitStatus == 0) {
          context
              .read<ExamUnitProvider>()
              .setSelectedChoiceValue(widget.choiceValue);
          if (widget.choiceValue == correctValue) {
            context.read<ExamUnitProvider>().setResult(true);
          }
          context.read<ExamUnitProvider>().setStatus(1);
          submitLearningBoxExamResult(SubmitLearningBoxExamResultRequest(
            userWordSource: context.read<ExamUnitProvider>().userWordSourceId,
            wordId: examItem.wordId,
            result: context.read<ExamUnitProvider>().result,
          )).then((value) => {
                context.read<ExamUnitProvider>().learningBoxSize =
                    value.learningBoxSize,
              });
        }
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
                    color: setChoiceColor(),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    widget.choiceValue,
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
    );
  }
}
