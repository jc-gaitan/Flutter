import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_example/bloc/usuario/usuario_cubit.dart';
import 'package:flutter_cubit_example/models/usuario.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioCubit = context.read<UsuarioCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 2'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
              child: Text('Establecer Usuario',
                  style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                final user = Usuario(nombre: "Juan", edad: 25, profesiones: [
                  "Profesion 1",
                  "Profesion 2",
                ]);
                //busca dentro del context un bloc
                usuarioCubit.selecionarUsuario(user);
              }),
          MaterialButton(
              child:
                  Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                usuarioCubit.cambiarEdad(40);
              }),
          MaterialButton(
              child: Text('Añadir Profesion',
                  style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                usuarioCubit.agregarProfesion();
              }),
        ],
      )),
    );
  }
}
