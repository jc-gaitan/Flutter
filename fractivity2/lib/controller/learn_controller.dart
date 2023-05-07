import 'package:flutter/material.dart';
import 'package:fractivity/utils/assets_constant.dart';
import 'package:get/get.dart';

class LearnController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxString activity = ActConstant.simples[0][0].obs;
  RxInt posMenu = 0.obs;
  RxInt posAct = 0.obs;
  RxInt posExp = 0.obs;

  List<List<String>> act = ActConstant.simples;

  void changeActivity(List<List<String>> activity, String txt, int pos) {
    act = activity;
    this.activity.value = act[0][0];
    posMenu.value = pos;
    posAct.value = 0;
    posExp.value = 0;
    debugPrint("${posMenu.value}");
  }

  void nextActivity(int length) {
    posExp.value = 0;
    if (posAct.value == length - 1) {
      posAct.value = 0;
    } else {
      posAct.value = posAct.value + 1;
    }

    activity.value = act[posAct.value][0];
  }

  void nextExp(int length) {
    if (posExp.value == length - 1) {
      posExp.value = 0;
    } else {
      posExp.value = posExp.value + 1;
    }

    activity.value = act[posAct.value][posExp.value];
  }

  void backExp(int length) {
    if (posExp.value == 0) {
      posExp.value = length - 1;
    } else {
      posExp.value = posExp.value - 1;
    }

    activity.value = act[posAct.value][posExp.value];
  }
}
