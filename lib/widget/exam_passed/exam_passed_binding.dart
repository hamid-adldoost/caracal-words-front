import 'package:caracal_words/widget/exam_passed/exam_passed_controller.dart';
import 'package:get/get.dart';

class ExamPassedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExamPassedController>(() => ExamPassedController());
  }
}
