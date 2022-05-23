import 'dart:async';
import 'dart:io';
import 'package:rxdart/rxdart.dart';

import 'package:gym_firebase/src/models/user_model.dart';
import 'package:gym_firebase/src/providers/user_provider.dart';

class UserBloc {
  final _userController = BehaviorSubject<UserModel>();
  final _cargandoController = BehaviorSubject<bool>();

  final UserProvider userProvider = new UserProvider();

  //Recuperar los datos
  Stream<UserModel> get userStream => _userController.stream;
  Stream<bool> get cargando => _cargandoController.stream;

  void cargarUser() async {
    final usuario = await userProvider.cargarUsuario();

    updateUser(usuario);
  }

  void editarUser(UserModel usuario) async {
    _cargandoController.sink.add(true);

    await userProvider.editarUsuario(usuario);

    _cargandoController.sink.add(false);
  }

  Future<String> subirFoto(File foto) async {
    _cargandoController.sink.add(true);

    String fotoUrl = await userProvider.subirImagen(foto);

    _cargandoController.sink.add(false);

    return fotoUrl;
  }

  void eliminarUser(UserModel usuario) async {
    await userProvider.borrarUsuario(usuario.email);
  }

  //Enviar datos a los stream
  Function(UserModel) get updateUser => _userController.sink.add;

  //Obtener el ultimo valor ingresado a los stream
  UserModel get user => _userController.value;

  //Cerrar los Stream
  dispose() {
    _userController.close();
    _cargandoController.close();
  }
}
