import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_chat_app/constant/constant.dart';
import 'package:my_chat_app/controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Iniciar sesión')),
      body: ListView(
        padding: formPadding,
        children: [
          TextFormField(
            controller: _controller.emailController,
            decoration: const InputDecoration(labelText: 'Email'),
            keyboardType: TextInputType.emailAddress,
          ),
          formSpacer,
          TextFormField(
            controller: _controller.passwordController,
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          formSpacer,
          Obx(
            () => ElevatedButton(
              onPressed:
                  _controller.isLoading.value ? null : _controller.signIn,
              child: const Text('Login'),
            ),
          ),
          formSpacer,
          TextButton(
            onPressed: () => _controller.goToRegister(),
            child: const Text('Crear cuenta'),
          )
        ],
      ),
    );
  }
}
