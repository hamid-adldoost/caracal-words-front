
// import 'package:caracal_words/widget/word_source_exam/word_exam_item_service.dart';
// import 'package:flutter/material.dart';

// class ExamUnitProvider extends ChangeNotifier {

//   var examUnitStatus = 0; //0 for fresh, 1 for used
//   late String selectedChoiceValue;
//   var examIndex = 0;
//   late WordExamItem examItem;
  
//   bool result = false;
//   late int learningBoxSize = 10;

//   resetStatus() {
//     examUnitStatus = 0;
//     notifyListeners();
//   }

//   setStatus(int status) {
//     examUnitStatus = status;
//     notifyListeners();
//   }

//   setWordExamItem(WordExamItem unit) {
//     examItem = unit; 
//     notifyListeners();
//   }

//   setExamIndex(int index) {
//     examIndex = index;
//     notifyListeners();
//   }

//   setResult(bool res) {
//     result = res;
//     notifyListeners();
//   }

//   setLearningBoxSize(int size) {
//     learningBoxSize = size;
//     notifyListeners();
//   }

//   increaseExamIndex() {
//     examIndex++;
//     notifyListeners();
//   }

//   setSelectedChoiceValue(String value) {
//     selectedChoiceValue = value;
//     notifyListeners();
//   }
// }