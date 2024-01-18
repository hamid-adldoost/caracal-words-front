import 'package:caracal_words/widget/word_exam_choice/word_exam_choice_widget.dart';
import 'package:caracal_words/widget/word_source_exam/word_source_exam_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'dart:math';

class WordExamUnitWidget extends GetView<WordSourceExamController> {
  const WordExamUnitWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Expanded(
              flex: 6,
              child: Text(
                'Word Exam',
              ),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                child: const Icon(Icons.exit_to_app),
                onTap: () {
                  controller.gotoLoginPage();
                },
              ),
            )
          ],
        ),
      ),
      body: Obx(
        () => controller.loading.value
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 5),
                      child: LinearPercentIndicator(
                        center: Text(
                          '${controller.examIndex.value + 1}/${controller.examItem.value.learningBoxSize}',
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        percent: ((controller.examIndex.value + 1) /
                            controller.examItem.value.learningBoxSize),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(bottom: 10),
                                      alignment: Alignment.topLeft,
                                      height: 20,
                                      child: Row(
                                        children: [
                                          ListView.builder(
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: controller
                                                .examItem.value.correctAnswerCount,
                                            itemBuilder: (context, index) {
                                              return const Icon(
                                                Icons.check,
                                                weight: 700,
                                                color:
                                                    Color.fromRGBO(100, 200, 150, 1),
                                              );
                                            },
                                          ),
                                          ListView.builder(
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: controller
                                                .examItem.value.inCorrectAnswerCount,
                                            itemBuilder: (context, index) {
                                              return const Icon(
                                                Icons.close,
                                                weight: 700,
                                                color:
                                                    Color.fromRGBO(220, 50, 50, 1),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      controller.examItem.value.originalWord,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 36,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        LinearPercentIndicator(
                                          percent: (max(
                                                  controller
                                                      .examItem.value.score,
                                                  0) /
                                              10),
                                          progressColor: Colors.greenAccent,
                                          backgroundColor: Colors.red,
                                          width: 150,
                                          lineHeight: 5,
                                          // center: Text(
                                          //   "${'score : ${controller.examItem.value.score}'} / 10",
                                          // ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Text(
                                        controller.examItem.value.pronunciation,
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
                              controller.showEnglishMeaningSnakeBar();
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
                                  controller.showExampleSnakbar();
                                  // ScaffoldMessenger.of(context)
                                  //     .showSnackBar(SnackBar(
                                  //   content: Text(examItem.examples),
                                  //   showCloseIcon: true,
                                  // ));
                                },
                                child: const Text('Show Example',
                                    textAlign: TextAlign.center),
                              )),
                        ),
                      ],
                    ),
                    WordExamChoiceWidget(
                      choiceValue: controller.examItem.value.choices[0],
                    ),
                    WordExamChoiceWidget(
                      choiceValue: controller.examItem.value.choices[1],
                    ),
                    WordExamChoiceWidget(
                      choiceValue: controller.examItem.value.choices[2],
                    ),
                    WordExamChoiceWidget(
                      choiceValue: controller.examItem.value.choices[3],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextButton(
                      onPressed: () {
                        controller.fetchNextExamItem();
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
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
              ),
      ),
    );
  }
}
