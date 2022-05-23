import 'package:flutter/material.dart';

import 'package:gym_firebase/src/bloc/user_bloc.dart';
export 'package:gym_firebase/src/bloc/user_bloc.dart';

class BlocProvider extends InheritedWidget {
  final _userBloc = UserBloc();

  static BlocProvider? _instancia;

  factory BlocProvider({Key? key, required Widget child}) {
    if (_instancia == null) {
      _instancia = new BlocProvider._internal(key: key, child: child);
    }

    return _instancia!;
  }

  BlocProvider._internal({Key? key, required Widget child})
      : super(key: key, child: child);

  // Provider({ Key key, Widget child })
  //   : super(key: key, child: child );

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static UserBloc userBloc(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<BlocProvider>()!
        ._userBloc;
  }
}
