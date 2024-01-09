import 'package:caracal_words/widget/splashscreen/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.moveToLoginPage();
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome to Caracal...')),
      body: const Center(
        child: Text('Welcome to Caracal...'),
      ),
    );
  }
}
