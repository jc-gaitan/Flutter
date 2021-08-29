import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controllers/splash_controller.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SplashController(),
      builder: (_) => Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
