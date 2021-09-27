import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:powergym/app/config/routes/app_pages.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final phoneNumber = TextEditingController();
  final isLoading = false.obs;

  void goToRegistrationScreen() {
    Get.offNamed(Routes.registration);
  }

  void goToAuthenticationScreen() {
    Get.toNamed(Routes.authentication);
  }

  void login() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      update(['loginButton']);

      Get.toNamed(
        Routes.authentication,
        parameters: {'phone_number': "+57" + phoneNumber.text},
      );
      isLoading.value = false;
    }
  }
}
