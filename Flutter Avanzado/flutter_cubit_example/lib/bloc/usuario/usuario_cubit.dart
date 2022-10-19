import 'package:flutter_cubit_example/models/usuario.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'usuario_state.dart';

class UsuarioCubit extends Cubit<UsuarioState> {
  UsuarioCubit() : super(UsuarioInitial());

  void selecionarUsuario(Usuario usuario) {
    emit(UsuarioActivo(usuario));
  }

  void cambiarEdad(int edad) {
    final currentState = state;
    if (currentState is UsuarioActivo) {
      final newUser = currentState.usuario.copyWith(edad: edad);
      emit(UsuarioActivo(newUser));
    }
  }

  void agregarProfesion() {
    final currentState = state;
    if (currentState is UsuarioActivo) {
      final newProfesiones = [
        ...currentState.usuario.profesiones,
        'Profesion ${currentState.usuario.profesiones.length + 1}'
      ];
      final newUser =
          currentState.usuario.copyWith(profesiones: newProfesiones);
      emit(UsuarioActivo(newUser));
    }
  }

  void borrarUsuario() {
    emit(UsuarioInitial());
  }
}
