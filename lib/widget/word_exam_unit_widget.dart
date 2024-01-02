import 'package:caracal_words/service/word_exam_item_service.dart';
import 'package:caracal_words/provider/exam_unit_provider.dart';
import 'package:caracal_words/widget/exam_passed.dart';
import 'package:caracal_words/widget/word_exam_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'dart:math';

class WordExamUnitWidget extends StatefulWidget {
  const WordExamUnitWidget({super.key});

  @override
  State<WordExamUnitWidget> createState() => _WordExamUnitWidgetState();
}

class _WordExamUnitWidgetState extends State<WordExamUnitWidget> {
  late Future<WordExamItem> wordExamItem;
  @override
  void initState() {
    super.initState();
    wordExamItem = wordExamItem = fetchWordFromLearningBox(
      context.read<ExamUnitProvider>().userWordSourceId,
      0,
    );
  }

  fetchNextExamItem() {
    context.read<ExamUnitProvider>().setStatus(0);
    if (context.read<ExamUnitProvider>().examIndex + 1 <
        context.read<ExamUnitProvider>().learningBoxSize) {
      context.read<ExamUnitProvider>().increaseExamIndex();
      wordExamItem = fetchWordFromLearningBox(
        context.read<ExamUnitProvider>().userWordSourceId,
        context.read<ExamUnitProvider>().examIndex,
      );
    } else {
      print('finished the learning box');
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('learning finished'),
        showCloseIcon: true,
      ));
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) {
          return const ExamPassedWidget();
        },
      ));
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    context.watch<ExamUnitProvider>();
    print(
        'exam index ' + context.read<ExamUnitProvider>().examIndex.toString());
    print('learning box size ' +
        context.read<ExamUnitProvider>().learningBoxSize.toString());
    return FutureBuilder(
      future: wordExamItem,
      builder: ((context, snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }

        final examItem = snapshot.data!;
        context
            .read<ExamUnitProvider>()
            .setLearningBoxSize(examItem.learningBoxSize);
        context.read<ExamUnitProvider>().setWordExamItem(examItem);
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                child: LinearPercentIndicator(
                  center: Text(
                    '${context.read<ExamUnitProvider>().examIndex + 1}/${context.read<ExamUnitProvider>().learningBoxSize}',
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  percent: ((context.read<ExamUnitProvider>().examIndex + 1) /
                      context.read<ExamUnitProvider>().learningBoxSize),
                  backgroundColor: Colors.blueGrey,
                  lineHeight: 15,
                  progressColor: Colors.green,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            children: [
                              Text(
                                examItem.originalWord,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 36,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  LinearPercentIndicator(
                                    percent: (max(examItem.score, 0) / 10),
                                    progressColor: Colors.greenAccent,
                                    backgroundColor: Colors.white,
                                    width: 150,
                                    lineHeight: 20,
                                    center: Text(
                                      "${'score : ${examItem.score}'} / 10",
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                  examItem.pronunciation,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(examItem.sourceLanguageMeaning),
                          showCloseIcon: true,
                        ));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text('English Meaning',
                            textAlign: TextAlign.center),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(examItem.examples),
                              showCloseIcon: true,
                            ));
                          },
                          child: const Text('Show Example',
                              textAlign: TextAlign.center),
                        )),
                  ),
                ],
              ),
              WordExamChoice(
                choiceValue: examItem.choices[0],
              ),
              WordExamChoice(
                choiceValue: examItem.choices[1],
              ),
              WordExamChoice(
                choiceValue: examItem.choices[2],
              ),
              WordExamChoice(
                choiceValue: examItem.choices[3],
              ),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                onPressed: () {
                  fetchNextExamItem();
                },
                child: Row(
                  children: [
                    const Expanded(
                      flex: 2,
                      child: SizedBox(
                        height: 20,
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(5),
                        child: const Text(
                          'Next Word',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const Expanded(
                      flex: 2,
                      child: SizedBox(
                        height: 20,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
