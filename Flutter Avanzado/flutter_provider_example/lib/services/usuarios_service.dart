import 'package:flutter/material.dart';
import 'package:flutter_provider/models/usuario.dart';

class UsuarioService with ChangeNotifier {
  Usuario? _usuario;

  Usuario? get usuario => _usuario;

  bool get existeUsuario => _usuario != null;

  set usuario(Usuario? user) {
    _usuario = user;
    //notifica a todos los camblos a los lugares que se este usando UsuarioService
    notifyListeners();
  }

  void cambiarEdad(int edad) {
    _usuario!.edad = edad;
    notifyListeners();
  }

  void removerUsuario() {
    _usuario = null;
    notifyListeners();
  }

  void addProfesion() {
    _usuario!.profesiones.add('Profesion #${_usuario!.profesiones.length + 1}');
    notifyListeners();
  }
}
