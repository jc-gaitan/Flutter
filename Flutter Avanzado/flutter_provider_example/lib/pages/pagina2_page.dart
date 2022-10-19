import 'package:flutter/material.dart';
import 'package:flutter_provider/models/usuario.dart';
import 'package:flutter_provider/services/usuarios_service.dart';
import 'package:provider/provider.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    final usuarioService = Provider.of<UsuarioService>(context);

    return Scaffold(
      appBar: AppBar(
        title: usuarioService.existeUsuario
            ? Text(usuarioService.usuario!.nombre)
            : const Text('Pagina 2'),
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
              final user = Usuario(nombre: "Juan", edad: 30, profesiones: [
                'Profesion #1',
                'Profesion #2',
              ]);

              //cuando estamos dentro de un metodo sin build lo que se hace es poner el listen en false
              /*final usuarioService =
                  Provider.of<UsuarioService>(context, listen: false);*/

              usuarioService.usuario = user;
            },
          ),
          MaterialButton(
            child: Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
            color: Colors.blue,
            onPressed: () {
              usuarioService.cambiarEdad(45);
            },
          ),
          MaterialButton(
            child:
                Text('Añadir Profesion', style: TextStyle(color: Colors.white)),
            color: Colors.blue,
            onPressed: () {
              usuarioService.addProfesion();
            },
          ),
        ],
      )),
    );
  }
}
