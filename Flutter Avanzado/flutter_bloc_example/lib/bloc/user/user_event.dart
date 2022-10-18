part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class ActivarUsuarioEvent extends UserEvent {
  final Usuario usuario;

  ActivarUsuarioEvent(this.usuario);
}

class ChangeUserAgeEvent extends UserEvent {
  final int edad;

  ChangeUserAgeEvent(this.edad);
}

class AddProfessionEvent extends UserEvent {
  final String profesion;

  AddProfessionEvent(this.profesion);
}

class DeleteUserEvent extends UserEvent {}
