import 'dart:async';

import 'package:caracal_words/routes/app_routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  moveToLoginPage() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.offNamed(AppRoutes.Login);
    });
  }
}
