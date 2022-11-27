import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get/get.dart';
import 'package:inventario/controllers/login_controller.dart';
import 'package:inventario/providers/auth_provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return GetX<LoginController>(
      init: controller,
      builder: (_) {
        return Scaffold(
          backgroundColor: const Color.fromRGBO(44, 56, 74, 1.0),
          body: body(),
          bottomNavigationBar: loginButton(),
        );
      },
    );
  }

  Widget loginButton() {
    return Container(
      height: 50.0,
      margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
      child: (!controller.isLoading.value)
          ? FutureBuilder(
              future: Authentication.initializeFirebase(context: Get.context!),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text('Error al inicializar Firebase');
                } else if (snapshot.connectionState == ConnectionState.done) {
                  return googleSignInButton();
                }
                return CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Get.theme.primaryColor,
                  ),
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(
                color: Get.theme.primaryColor,
              ),
            ),
    );
  }

  Widget googleSignInButton() {
    return SignInButton(
      Buttons.Google,
      text: "Iniciar sesión con Google",
      onPressed: controller.signInWithGoogle,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // <-- Radius
      ),
      padding: const EdgeInsets.symmetric(vertical: 5.0),
    );
  }

  Widget body() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      color: const Color.fromRGBO(44, 56, 74, 1.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(
            Icons.inventory_2_outlined,
            size: 200.0,
            color: Colors.white,
          ),
          Text(
            "BIENVENIDA \nESTA ES TU APP DE INVENTARIO",
            style: TextStyle(
              fontSize: 22.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
