import 'dart:async';

import 'package:rxdart/rxdart.dart';

import 'package:formvalidation/src/bloc/validators.dart';

class LoginBloc with Validators {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  //Recuperar los datos
  Stream<String> get emailStream =>
      _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(validarPassword);

  Stream<bool> get formValidStream =>
      Rx.combineLatest2(emailStream, passwordStream, (a, b) => true);

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
