import 'package:caracal_words/page/word_exam_page.dart';
import 'package:caracal_words/provider/exam_unit_provider.dart';
import 'package:caracal_words/widget/login_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ExamUnitProvider(),
      child: MaterialApp(
        title: 'Easy Learn English!',
        theme: ThemeData(
          fontFamily: 'Vazirmatn',
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(0, 110, 130, 1),
            primary: const Color.fromRGBO(0, 110, 130, 1),
          ),
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            color: Colors.lightGreenAccent,
            titleTextStyle: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          // colorScheme: const ColorScheme.dark(),
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35,
            ),
            titleMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            bodySmall: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          useMaterial3: true,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Login',
            ),
          ),
          body: LoginWidget(),
        ),
      ),
    );
  }
}
