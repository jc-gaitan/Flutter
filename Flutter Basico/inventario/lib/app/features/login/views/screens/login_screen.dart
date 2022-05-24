library login_view;

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get/get.dart';

import 'package:inventario/app/features/login/controller/login_controller.dart';
import 'package:inventario/app/providers/auth.dart';

part '../components/login_button.dart';
part '../components/back_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      id: 'login',
      builder: (_) {
        return Scaffold(
          backgroundColor: const Color.fromRGBO(44, 56, 74, 1.0),
          body: const BackWidget(),
          bottomNavigationBar: (!_.isLoading)
              ? const GoogleSignInButton()
              : Center(
                  child: CircularProgressIndicator(
                    color: Get.theme.primaryColor,
                  ),
                ),
        );
      },
    );
  }
}
