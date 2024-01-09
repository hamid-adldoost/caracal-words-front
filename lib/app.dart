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
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.Splash,
      getPages: AppPages.pages,
    );
  }
}
