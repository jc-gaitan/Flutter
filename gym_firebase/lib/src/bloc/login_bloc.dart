import 'dart:async';

import 'package:rxdart/rxdart.dart';

//import 'package:formvalidation/src/bloc/validators.dart';

class LoginBloc {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  //Recuperar los datos
  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get passwordStream => _passwordController.stream;

  //Enviar datos a los stream
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  //Obtener el ultimo valor ingresado a los stream
  String get email => _emailController.value;
  String get password => _passwordController.value;

  //Cerrar los Stream
  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
