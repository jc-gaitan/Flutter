import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_chat_app/config/routes/app_pages.dart';
import 'package:my_chat_app/constant/constant.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegisterController extends GetxController {
  //
  final bool isLoading = false;

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();

  Future<void> signUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    final email = emailController.text;
    final password = passwordController.text;
    final username = usernameController.text;
    try {
      await supabase.auth.signUp(
          email: email, password: password, data: {'username': username});
      Get.snackbar("Éxito ", "Usuario creado con éxito");
      Get.offAllNamed(Routes.login);
    } on AuthException catch (error) {
      Get.snackbar("Error ", error.message);
      //context.showErrorSnackBar(message: error.message);
    } catch (error) {
      Get.snackbar("Error ", unexpectedErrorMessage);
      //context.showErrorSnackBar(message: unexpectedErrorMessage);
    }
  }

  void toLogin() {
    Get.offAllNamed(Routes.login);
  }
}
