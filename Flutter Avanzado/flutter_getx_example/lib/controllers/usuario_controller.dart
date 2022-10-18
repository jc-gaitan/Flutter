import 'package:get/get.dart';

import 'package:flutter_getx_example/models/usuario.dart';

class UsuarioController extends GetxController {
  RxBool existeUsuario = false.obs;
  Rx<Usuario> usuario = Usuario().obs;

  int get profesionCount => usuario.value.profesiones.length;

  void cargarUsuario(Usuario user) {
    existeUsuario.value = true;
    usuario.value = user;
  }

  void cambiarEdad(int edad) {
    usuario.update((val) {
      //no lo ejecuta si val es null
      val?.edad = edad;
      //lo ejecuta asi val sea null
      //val!.edad = edad;
    });
  }

  void addProfesion(String profesion) {
    usuario.update((val) {
      //val?.profesiones.add(profesion);
      val?.profesiones = [...val.profesiones, profesion];
    });
  }
}
