import 'package:caracal_words/page/word_exam_page.dart';
import 'package:caracal_words/service/login_service.dart';
import 'package:flutter/material.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        children: [
          TextField(
            onChanged: (value) {
              print('username value : ' + value);
              username = value;
            },
            decoration: const InputDecoration(
              hintText: 'username',
            ),
          ),
          TextField(
            onChanged: (value) {
              print('password value : ' + value);
              password = value;
            },
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
                      print('login...');
                      login(LoginRequest(
                              username: username, password: password))
                          .then(
                              (value) => Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return const WordExamUnit();
                                      },
                                    ),
                                  ));
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
    );
  }
}
