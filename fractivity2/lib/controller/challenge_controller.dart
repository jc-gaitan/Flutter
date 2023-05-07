import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChallengeController extends GetxController {
  RxInt posMenu = 0.obs;
  RxBool gen = false.obs;

  late Timer timer;
  RxInt time = 120.obs;

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    time.value = 120;
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (time.value == 0) {
          timeOver();
          timer.cancel();
        } else {
          time.value--;
        }
      },
    );
  }

  void changeActivity(int pos) {
    posMenu.value = pos;
    timer.cancel();
    startTimer();
    //debugPrint("${posMenu.value}");
  }

  void nextActivity() {}

  void correct() {
    AwesomeDialog(
      context: Get.context!,
      dialogType: DialogType.success,
      animType: AnimType.rightSlide,
      desc: 'Respuesta correcta.',
      descTextStyle: const TextStyle(
        fontSize: 20.0,
      ),
      btnOkOnPress: () {
        gen.value = !gen.value;
        timer.cancel();
        startTimer();
        //debugPrint("${gen.value}");
      },
      btnOkText: 'Siguente actividad.',
      dismissOnBackKeyPress: false,
      width: 400.0,
    ).show();
  }

  void incorrect() {
    AwesomeDialog(
      context: Get.context!,
      dialogType: DialogType.error,
      animType: AnimType.rightSlide,
      desc: 'Respuesta incorrecta.',
      descTextStyle: const TextStyle(
        fontSize: 20.0,
      ),
      btnOkOnPress: () {},
      btnOkText: 'Aceptar',
      dismissOnBackKeyPress: false,
      width: 400.0,
    ).show();
  }

  void timeOver() {
    AwesomeDialog(
      context: Get.context!,
      dialogType: DialogType.warning,
      animType: AnimType.rightSlide,
      desc: 'El tiempo se acabo.',
      descTextStyle: const TextStyle(
        fontSize: 20.0,
      ),
      btnOkOnPress: () {
        gen.value = !gen.value;
        startTimer();
        //debugPrint("${gen.value}");
      },
      btnOkText: 'Siguente actividad.',
      dismissOnBackKeyPress: false,
      width: 400.0,
    ).show();
  }
}
