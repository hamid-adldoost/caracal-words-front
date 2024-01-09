import 'package:caracal_words/widget/exam_passed/exam_passed_binding.dart';
import 'package:caracal_words/widget/exam_passed/exam_passed_widget.dart';
import 'package:caracal_words/widget/login/login_bindings.dart';
import 'package:caracal_words/widget/splashscreen/spash_bindings.dart';
import 'package:caracal_words/routes/app_routes.dart';
import 'package:caracal_words/widget/splashscreen/splash_screen.dart';
import 'package:caracal_words/widget/login/login_widget.dart';
import 'package:caracal_words/widget/word_source_exam/word_exam_unit_widget.dart';
import 'package:caracal_words/widget/word_source_exam/word_source_exam_binding.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.Splash,
      page: () => const SplashScreen(),
      binding: SplashBindings(),
    ),
    GetPage(
      name: AppRoutes.Login,
      page: () => const LoginWidget(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: AppRoutes.WordExam,
      page: () => const WordExamUnitWidget(),
      binding: WordSourceExamBindings(),
    ),
    GetPage(
      name: AppRoutes.ExamPassed,
      page: () => const ExamPassedWidget(),
      binding: ExamPassedBinding(),
    ),
  ];
}
