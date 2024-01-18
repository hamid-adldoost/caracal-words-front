import 'package:caracal_words/routes/app_pages.dart';
import 'package:caracal_words/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Caracal Language Training',
      debugShowCheckedModeBanner: true,
      defaultTransition: Transition.fade,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          actionsIconTheme: IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: Colors.blueAccent,
        ),
        primarySwatch: Colors.amber,
        buttonTheme: ButtonTheme.of(context).copyWith(
          textTheme: ButtonTextTheme.primary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        ),
        textTheme: const TextTheme(
          titleSmall: TextStyle(color: Colors.black),
          bodySmall: TextStyle(color: Colors.black),
        ),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.Splash,
      getPages: AppPages.pages,
    );
  }
}
