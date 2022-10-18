import 'package:flutter/material.dart';
import 'package:flutter_getx_example/models/usuario.dart';
import 'package:get/get.dart';

import '../controllers/usuario_controller.dart';

class Pagina2Page extends StatelessWidget {
  //Optiene el controlador
  final usuarioCtrl = Get.find<UsuarioController>();
  @override
  Widget build(BuildContext context) {
    print(Get.arguments);

    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 2'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            child: Text('Establecer Usuario',
                style: TextStyle(color: Colors.white)),
            color: Colors.blue,
            onPressed: () {
              usuarioCtrl.cargarUsuario(
                Usuario(
                  nombre: 'Juan',
                  edad: 30,
                  profesiones: ['Profesion #1', 'Profesion #2'],
                ),
              );
              Get.snackbar("Exito", "Usuario Cargado",
                  snackPosition: SnackPosition.BOTTOM);
            },
          ),
          MaterialButton(
              child:
                  Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                usuarioCtrl.cambiarEdad(20);
              }),
          MaterialButton(
            child:
                Text('Añadir Profesion', style: TextStyle(color: Colors.white)),
            color: Colors.blue,
            onPressed: () {
              usuarioCtrl
                  .addProfesion("Profesion #${usuarioCtrl.profesionCount + 1}");
            },
          ),
          MaterialButton(
            child: Text('Cambiar Tema', style: TextStyle(color: Colors.white)),
            color: Colors.blue,
            onPressed: () {
              Get.changeTheme(
                  Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
            },
          ),
        ],
      )),
    );
  }
}
