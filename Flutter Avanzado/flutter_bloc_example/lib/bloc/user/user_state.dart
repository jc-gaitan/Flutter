part of 'user_bloc.dart';

@immutable
abstract class UserState {
  final bool existUser;
  final Usuario? user;

  const UserState({this.existUser = false, this.user});
}

class UserStateInitial extends UserState {
  const UserStateInitial() : super(existUser: false, user: null);
}

class UserSetState extends UserState {
  const UserSetState(Usuario user) : super(existUser: true, user: user);
}
