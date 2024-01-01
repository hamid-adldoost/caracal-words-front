
import 'package:caracal_words/model/word_exam_item_service.dart';
import 'package:flutter/material.dart';

class ExamUnitProvider extends ChangeNotifier {

  var examUnitStatus = 0; //0 for fresh, 1 for used
  var examIndex = 0;
  late WordExamItem examItem;
  var userWordSourceId = '13b53ef9-502e-46d4-b9e6-9ab5e16c62da';
  bool result = false;
  late int learningBoxSize;

  resetStatus() {
    examUnitStatus = 0;
  }

  setStatus(int status) {
    examUnitStatus = status;
  }

  setWordExamItem(WordExamItem unit) {
    examItem = unit; 
  }

  setExamIndex(int index) {
    examIndex = index;
  }

  setResult(bool res) {
    result = res;
  }

  setLearningBoxSize(int size) {
    learningBoxSize = size;
  }

}