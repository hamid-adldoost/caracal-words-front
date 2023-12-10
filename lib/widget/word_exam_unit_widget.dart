import 'package:caracal_words/model/word_exam_item_service.dart';
import 'package:caracal_words/provider/exam_unit_provider.dart';
import 'package:caracal_words/widget/word_exam_choice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WordExamUnitWidget extends StatefulWidget {
  const WordExamUnitWidget({super.key});

  @override
  State<WordExamUnitWidget> createState() => _WordExamUnitWidgetState();
}

class _WordExamUnitWidgetState extends State<WordExamUnitWidget> {
  late Future<WordExamItem> wordExamItem;

  @override
  void initState() {
    print('123');
    super.initState();
    wordExamItem = fetchRandomWordExamItem();
    print('456' + wordExamItem.toString());
  }

  reloadExamUnit() {
    wordExamItem = fetchRandomWordExamItem();
    context.read<ExamUnitProvider>().setStatus(0);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: wordExamItem,
      builder: ((context, snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }

        final examItem = snapshot.data!;
        context.read<ExamUnitProvider>().setWordExamItem(examItem);

        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
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
                  setState(() {
                    reloadExamUnit();
                  });
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
