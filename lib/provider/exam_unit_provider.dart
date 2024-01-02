
import 'package:caracal_words/service/word_exam_item_service.dart';
import 'package:flutter/material.dart';

class ExamUnitProvider extends ChangeNotifier {

  var examUnitStatus = 0; //0 for fresh, 1 for used
  late String selectedChoiceValue;
  var examIndex = 0;
  late WordExamItem examItem;
  var userWordSourceId = '13b53ef9-502e-46d4-b9e6-9ab5e16c62da';
  bool result = false;
  late int learningBoxSize = 10;

  resetStatus() {
    examUnitStatus = 0;
    notifyListeners();
  }

  setStatus(int status) {
    examUnitStatus = status;
    notifyListeners();
  }

  setWordExamItem(WordExamItem unit) {
    examItem = unit; 
    notifyListeners();
  }

  setExamIndex(int index) {
    examIndex = index;
    notifyListeners();
  }

  setResult(bool res) {
    result = res;
    notifyListeners();
  }

  setLearningBoxSize(int size) {
    learningBoxSize = size;
    notifyListeners();
  }

  increaseExamIndex() {
    examIndex++;
    notifyListeners();
  }

  setSelectedChoiceValue(String value) {
    selectedChoiceValue = value;
    notifyListeners();
  }
}