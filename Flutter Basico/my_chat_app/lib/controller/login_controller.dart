import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_chat_app/config/routes/app_pages.dart';
import 'package:my_chat_app/constant/constant.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> signIn() async {
    isLoading.value = true;

    try {
      await supabase.auth.signInWithPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Get.offAllNamed(Routes.chat);
    } on AuthException catch (error) {
      Get.snackbar("Error ", error.message);
    } catch (_) {
      Get.snackbar("Error ", "$unexpectedErrorMessage ${_.toString()}");
    }
    isLoading.value = false;
  }

  void goToRegister() {
    Get.toNamed(Routes.register);
  }
}
