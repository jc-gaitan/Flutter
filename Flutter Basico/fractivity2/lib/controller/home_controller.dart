import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var isDialOpen = ValueNotifier<bool>(false);
  RxBool audio = true.obs;

  void mute() {
    audio.value = !audio.value;
  }

  goToRoute(String route) {
    Get.toNamed(route);
  }
}
