import 'dart:async';

import 'package:flutter_singleton/models/usuario.dart';

class _UsuarioService {
  late Usuario _usuario;

  StreamController<Usuario> _usuarioStreamController =
      new StreamController<Usuario>.broadcast();

  Usuario get usuario => this._usuario;
  bool get existeUsuario => (this._usuario != null) ? true : false;

  Stream<Usuario> get usuarioStream => _usuarioStreamController.stream;

  void cargarUsuario(Usuario user) {
    this._usuario = user;
    _usuarioStreamController.add(user);
  }

  void cambiarEdad(int edad) {
    this._usuario.edad = edad;
    _usuarioStreamController.add(this._usuario);
  }

  dispose() {
    _usuarioStreamController.close();
  }
}

final usuarioService = new _UsuarioService();
