import 'package:caracal_words/widget/word_source_exam/word_source_exam_controller.dart';
import 'package:get/get.dart';

class WordSourceExamBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WordSourceExamController>(() => WordSourceExamController());
  }
}