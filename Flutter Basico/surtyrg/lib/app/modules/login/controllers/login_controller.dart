import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:surtyrg/app/config/routes/app_pages.dart';
import 'package:surtyrg/app/utils/services/firebase_services.dart';

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
      await UserServices.phoneNumberExists("+57" + phoneNumber.text,
          onError: (_) {
        isLoading.value = false;
        //update(['loginButton']);
      }).then((exist) {
        isLoading.value = false;
        update(['loginButton']);
        if (exist) {
          Get.toNamed(
            Routes.authentication,
            parameters: {'phone_number': "+57" + phoneNumber.text},
          );
        } else {
          Get.snackbar(
            "Login Failed",
            "your phone number not exist",
            backgroundColor: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      });
    }
  }
}
