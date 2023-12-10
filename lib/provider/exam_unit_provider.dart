
import 'package:caracal_words/model/word_exam_item_service.dart';
import 'package:flutter/material.dart';

class ExamUnitProvider extends ChangeNotifier {

  var examUnitStatus = 0; //0 for fresh, 1 for used
  late WordExamItem examItem;

  resetStatus() {
    examUnitStatus = 0;
  }

  setStatus(int status) {
    examUnitStatus = status;
  }

  setWordExamItem(WordExamItem unit) {
    examItem = unit; 
  }

}