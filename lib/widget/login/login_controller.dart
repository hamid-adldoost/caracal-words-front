import 'package:caracal_words/widget/login/login_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var username = TextEditingController();
  var password = TextEditingController();

  void submitLoginForm() {
    login(LoginRequest(username: username.text, password: password.text))
        .then((value) => {
              print('login done'),
              Get.toNamed('/wordExam'),
            })
        .catchError((error, strackTrace) {
      Get.showSnackbar(GetSnackBar(
        title: 'error',
        message: 'Authentication Failed $error',
        duration: const Duration(seconds: 2),
      ));
      throw Exception();
    });
  }
}
