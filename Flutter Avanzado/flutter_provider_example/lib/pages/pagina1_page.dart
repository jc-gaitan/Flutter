import 'package:flutter/material.dart';
import 'package:flutter_provider/models/usuario.dart';
import 'package:flutter_provider/services/usuarios_service.dart';
import 'package:provider/provider.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    final usuarioService = Provider.of<UsuarioService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              usuarioService.removerUsuario();
            },
          ),
        ],
      ),
      body: usuarioService.existeUsuario
          ? InformacionUsuario(usuario: usuarioService.usuario)
          : const Center(child: Text("No hay usuario seleccionado")),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.accessibility_new),
          onPressed: () => Navigator.pushNamed(context, 'pagina2')),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario? usuario;

  const InformacionUsuario({super.key, this.usuario});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('General',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
          ListTile(title: Text('Nombre: ${usuario!.nombre}')),
          ListTile(title: Text('Edad: ${usuario!.edad}')),
          Text('Profesiones',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
          //... es para destructurar el array
          ...usuario!.profesiones
              .map((profesion) => ListTile(title: Text(profesion)))
              .toList()
        ],
      ),
    );
  }
}
