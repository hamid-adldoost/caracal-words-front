import 'package:caracal_words/widget/word_source_exam/submit-exam-result.dart';
import 'package:caracal_words/widget/word_source_exam/word_exam_item_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WordSourceExamController extends GetxController {
  var userWordSourceId = '13b53ef9-502e-46d4-b9e6-9ab5e16c62da';
  var examUnitStatus = 0.obs; //0 for fresh, 1 for used
  var selectedChoiceValue = ''.obs;
  var examIndex = 0.obs;

  var result = false.obs;
  var loading = false.obs;

  late Rx<WordExamItem> examItem;
  final choiceModeValues = [
    0, //not choosen
    1, //choosen
    2, //wrong choosen
  ];

  @override
  void onInit() {
    loading.value = true;
    fetchWordFromLearningBox(
      userWordSourceId,
      0,
    ).then((value) => {
          examItem = value.obs,
          print('exam item filled'),
          loading.value = false,
        });
    super.onInit();
  }

  fetchNextExamItem() {
    setStatus(0);
    if (examIndex.value + 1 < examItem.value.learningBoxSize) {
      increaseExamIndex();
      fetchWordFromLearningBox(
        userWordSourceId,
        examIndex.value,
      ).then((value) => {
            examItem.value = value,
          });
    } else {
      print('finished the learning box');
      Get.offAndToNamed('/examPassed');
    }
    update();
  }

  Color setChoiceColor(String choiceValue) {
    if (examUnitStatus.value == 0) {
      return Colors.blueGrey;
    } else {
      if (choiceValue == examItem.value.destinationLanguageMeaning) {
        return Colors.lightGreen;
      } else if (choiceValue == selectedChoiceValue.value) {
        return Colors.red;
      } else {
        return Colors.grey;
      }
    }
  }

  void onChoiceSelected(String choiceValue) {
    if (examUnitStatus.value == 0) {
      setSelectedChoiceValue(choiceValue);
      if (choiceValue == examItem.value.destinationLanguageMeaning) {
        setResult(true);
      }
      setStatus(1);
      submitLearningBoxExamResult(SubmitLearningBoxExamResultRequest(
        userWordSource: userWordSourceId,
        wordId: examItem.value.wordId,
        result: result.value,
      ));
    }
  }

  resetStatus() {
    examUnitStatus.value = 0;
  }

  setStatus(int status) {
    examUnitStatus.value = status;
  }

  setResult(bool res) {
    result.value = res;
  }

  // setLearningBoxSize(int size) {
  //   learningBoxSize.value = size;
  // }

  increaseExamIndex() {
    examIndex.value++;
  }

  void gotoLoginPage() {
    Get.offAllNamed('/login');
  }

  void showExampleSnakbar() {
    Get.showSnackbar(GetSnackBar(
      title: 'example',
      message: examItem.value.examples,
      duration: const Duration(seconds: 3),
      snackStyle: SnackStyle.FLOATING,
      isDismissible: true,
    ));
  }

  void setSelectedChoiceValue(String choiceValue) {
    selectedChoiceValue.value = choiceValue;
  }

  void showEnglishMeaningSnakeBar() {
    Get.showSnackbar(GetSnackBar(
      title: 'meaning',
      message: examItem.value.sourceLanguageMeaning,
      duration: const Duration(seconds: 3),
      snackStyle: SnackStyle.FLOATING,
      isDismissible: true,
    ));
  }
}
