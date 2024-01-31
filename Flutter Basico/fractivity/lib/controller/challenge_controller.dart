import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChallengeController extends GetxController {
  RxInt posMenu = 0.obs;
  RxBool gen = false.obs;

  void changeActivity(int pos) {
    posMenu.value = pos;
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
}
