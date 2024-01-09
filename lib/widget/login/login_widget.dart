import 'package:caracal_words/widget/login/login_controller.dart';
import 'package:caracal_words/widget/word_source_exam/word_exam_page.dart';
import 'package:caracal_words/widget/login/login_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class LoginWidget extends GetView<LoginController> {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            TextFormField(
              controller: controller.username,
              decoration: const InputDecoration(
                hintText: 'username',
              ),
            ),
            TextFormField(
              controller: controller.password,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: const InputDecoration(
                hintText: 'password',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                children: [
                  const Expanded(
                    flex: 1,
                    child: SizedBox(height: 30),
                  ),
                  Expanded(
                    flex: 1,
                    child: TextButton(
                      style: const ButtonStyle(
                        alignment: AlignmentDirectional.center,
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(Colors.lightBlue),
                      ),
                      child: Row(
                        children: [
                          Text(
                            'login',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const Icon(Icons.login),
                        ],
                      ),
                      onPressed: () {
                        controller.submitLoginForm();
                      },
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 10,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
