import 'package:flutter/material.dart';
import 'package:fractivity/utils/assets_constant.dart';
import 'package:get/get.dart';

class LearnController extends GetxController {
  RxString activity = ActConstant.simples[0].obs;
  RxInt posMenu = 0.obs;
  RxInt posAct = 0.obs;

  List<String> act = ActConstant.simples;

  void changeActivity(List<String> activity, String txt, int pos) {
    act = activity;
    this.activity.value = act[0];
    posMenu.value = pos;
    posAct.value = 0;
    debugPrint("${posMenu.value}");
  }

  void nextActivity(int length) {
    if (posAct.value == length - 1) {
      posAct.value = 0;
    } else {
      posAct.value = posAct.value + 1;
    }

    activity.value = act[posAct.value];

    //print(posAct);
  }
}
