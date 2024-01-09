import 'dart:async';

import 'package:caracal_words/routes/app_routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  moveToLoginPage() {
    Timer.periodic(const Duration(seconds: 3), (timer) => Get.toNamed(AppRoutes.Login)
    );
  }
}
