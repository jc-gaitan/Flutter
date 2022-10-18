import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/usuario.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserStateInitial()) {
    //emit se llama cuando se cambia el estado
    on<ActivarUsuarioEvent>((event, emit) {
      emit(UserSetState(event.usuario));
    });

    on<DeleteUserEvent>((event, emit) {
      emit(const UserStateInitial());
    });

    on<ChangeUserAgeEvent>((event, emit) {
      if (!state.existUser) return;
      emit(UserSetState(state.user!.copyWith(edad: event.edad)));
    });

    on<AddProfessionEvent>((event, emit) {
      if (!state.existUser) return;

      final profesiones = [...state.user!.profesiones, event.profesion];

      emit(UserSetState(state.user!.copyWith(profesiones: profesiones)));
    });
  }
}
