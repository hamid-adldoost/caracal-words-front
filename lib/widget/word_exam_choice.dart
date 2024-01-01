import 'package:caracal_words/provider/exam_unit_provider.dart';
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
  String correctValue = '';
  final choiceModeValues = [
    0, //not choosen
    1, //choosen
    2, //wrong choosen
  ];
  late int choiceMode;

  @override
  void initState() {
    choiceMode = 0;
    super.initState();
  }

  Color setChoiceColor(var examUnistStatus) {
    if (examUnistStatus == 1) {
      if (choiceMode == 0) {
        return Colors.grey;
      } else if (choiceMode == 1) {
        return Colors.lightGreen;
      } else {
        return const Color.fromRGBO(180, 10, 20, 1);
      }
    } else {
      return Colors.blueGrey;
    }
  }

  @override
  Widget build(BuildContext context) {
    var examUnitStatus = context.watch<ExamUnitProvider>().examUnitStatus;
    correctValue =
        context.read<ExamUnitProvider>().examItem.destinationLanguageMeaning;

    return GestureDetector(
      onTap: () {
        setState(() {
          if (widget.choiceValue == correctValue) {
            choiceMode = 1;
            context.read<ExamUnitProvider>().setResult(true);
          } else {
            choiceMode = 2;
            context.read<ExamUnitProvider>().setResult(true);
          }
        });
        context.read<ExamUnitProvider>().setStatus(1);
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
                    color: setChoiceColor(examUnitStatus),
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
