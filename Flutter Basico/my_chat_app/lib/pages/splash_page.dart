import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_chat_app/constant/constant.dart';
import 'package:my_chat_app/controller/splash_controller.dart';

class SplashPage extends StatelessWidget {
  SplashPage({super.key});

  //
  // ignore: unused_field
  final _controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: preloader);
  }
}
