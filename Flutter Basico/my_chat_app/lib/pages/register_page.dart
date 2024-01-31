import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_chat_app/constant/constant.dart';
import 'package:my_chat_app/controller/register_controller.dart';

class RegisterPage extends StatelessWidget {
  //
  final _controller = Get.put(RegisterController());

  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Cuenta'),
      ),
      body: Form(
        key: _controller.formKey,
        child: ListView(
          padding: formPadding,
          children: [
            TextFormField(
              controller: _controller.emailController,
              decoration: const InputDecoration(
                label: Text('Email'),
              ),
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return 'Requerido';
                }
                return null;
              },
              keyboardType: TextInputType.emailAddress,
            ),
            formSpacer,
            TextFormField(
              controller: _controller.passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                label: Text('Contraseña'),
              ),
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return 'Requerido';
                }
                if (val.length < 6) {
                  return '6 caracteres mínimo';
                }
                return null;
              },
            ),
            formSpacer,
            TextFormField(
              controller: _controller.usernameController,
              decoration: const InputDecoration(
                label: Text('Username'),
              ),
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return 'Requerido';
                }
                final isValid = RegExp(r'^[A-Za-z0-9_]{3,24}$').hasMatch(val);
                if (!isValid) {
                  return '3-24 largos con caracteres alfanuméricos o guiones bajos';
                }
                return null;
              },
            ),
            formSpacer,
            ElevatedButton(
              onPressed: _controller.isLoading ? null : _controller.signUp,
              child: const Text('Register'),
            ),
            formSpacer,
            TextButton(
              onPressed: () => _controller.toLogin,
              child: const Text('Ya tengo una cuenta'),
            )
          ],
        ),
      ),
    );
  }
}
