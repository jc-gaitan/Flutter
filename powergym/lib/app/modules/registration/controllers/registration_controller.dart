import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:powergym/app/config/routes/app_pages.dart';
import 'package:powergym/app/models/asistencia_model.dart';
import 'package:powergym/app/models/medidas_model.dart';
import 'package:powergym/app/models/user_model.dart';
import 'package:powergym/app/providers/user_provider.dart';

class RegistrationController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final name = TextEditingController();
  late String phoneNumber;
  final isLoading = false.obs;

  bool male = true;
  bool female = false;

  @override
  void onInit() {
    super.onInit();
    phoneNumber = _getPhoneNumber()!.substring(3);
  }

  void goToLoginScreen() {
    Get.offNamed(Routes.login);
  }

  void changeMale(bool? valor) {
    male = valor!;
    (male) ? female = false : female = true;

    update(['gender']);
  }

  void changeFemale(bool? valor) {
    female = valor!;
    (female) ? male = false : male = true;

    update(['gender']);
  }

  void _goToHome() {
    isLoading.value = false;
    Get.offAllNamed(Routes.home);
  }

  void register() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      update(['registerButton']);

      UserModel user = new UserModel(
        name: name.text,
        phoneNumber: '+57' + phoneNumber,
        age: '',
        gender: (male) ? 'Masculino' : 'Femenino',
        stature: '',
        weight: '',
      );

      List<Asistencia> asistencia = [];
      asistencia.add(
          new Asistencia(day: "01", month: "01", year: "2001", minutes: ''));

      user.asistencia = asistencia;

      List<Medidas> medidas = [];
      medidas.add(new Medidas(
          biceps: '',
          brazo: '',
          cadera: '',
          cintura: '',
          cuello: '',
          dia: '',
          gemelo: '',
          hombros: '',
          mes: '',
          muslo: '',
          pecho: '',
          year: ''));
      user.medidas = medidas;
      //
      UserProvider.addUser(
        user,
        onSuccess: () => _goToHome(),
        onError: (e) => isLoading.value = false,
      );
    }
  }

  String? _getPhoneNumber() {
    try {
      return Get.parameters['phone_number'];
    } catch (_) {
      return null;
    }
  }
}
