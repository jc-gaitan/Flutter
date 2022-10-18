import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/bloc/user/user_bloc.dart';

import '../models/usuario.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    final userBloc = BlocProvider.of<UserBloc>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 2'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            color: Colors.blue,
            onPressed: () {
              final Usuario user = Usuario(
                  nombre: "Juan",
                  edad: 30,
                  profesiones: ["Ingeniero", "Programador"]);

              userBloc.add(ActivarUsuarioEvent(user));
            },
            child: const Text(
              'Establecer Usuario',
              style: TextStyle(color: Colors.white),
            ),
          ),
          MaterialButton(
              child:
                  Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                userBloc.add(ChangeUserAgeEvent(25));
              }),
          MaterialButton(
              child: Text('Añadir Profesion',
                  style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                userBloc.add(AddProfessionEvent("Nueva Profesion"));
              }),
        ],
      )),
    );
  }
}
