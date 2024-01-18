import 'package:caracal_words/widget/login/login_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var username = TextEditingController();
  var password = TextEditingController();

  final formKey = GlobalKey<FormState>();

  validateUsername() {
    if(GetUtils.isNullOrBlank(username) == null) {
      return 'username is not valid';
    }
    return null;
  }

  validatePassword() {
    if(GetUtils.isNullOrBlank(password) == null) {
      return 'password is not valid';
    }
    return null;
  }


  void submitLoginForm() {
    print('login clicked');
    if(!formKey.currentState!.validate()) {
      print('not valid form');
      Get.showSnackbar(const GetSnackBar(
        title: 'Error',
        message: 'Form Validation Failed',
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ));
    }
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

  @override
  void onClose() {
    username.dispose();
    password.dispose();
  }
}
