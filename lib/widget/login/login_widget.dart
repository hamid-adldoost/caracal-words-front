import 'package:caracal_words/widget/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class LoginWidget extends GetView<LoginController> {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Row(
        children: [
          Image(
            image: AssetImage('/images/caracal-icon-final.png'),
            width: 60,
          ),
          Text(
            'Login',
            style: TextStyle(color: Colors.white),
          ),
        ],
      )),
      body: Form(
        key: controller.formKey,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              TextFormField(
                controller: controller.username,
                decoration: const InputDecoration(
                  hintText: 'username',
                ),
                validator: controller.validateUsername(),
              ),
              TextFormField(
                controller: controller.password,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                validator: controller.validatePassword(),
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
                        // child: Row(
                        // children: [
                        child: Text(
                          'login',
                          style: Theme.of(context).textTheme.titleSmall,
                          textAlign: TextAlign.center,
                        ),
                        // const Icon(Icons.login),
                        // ],
                        // ),
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
      ),
    );
  }
}
