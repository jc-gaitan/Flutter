import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_example/bloc/usuario/usuario_cubit.dart';
import 'package:flutter_cubit_example/models/usuario.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<UsuarioCubit>().borrarUsuario();
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: const BodyScaffold(),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.accessibility_new),
          onPressed: () => Navigator.pushNamed(context, 'pagina2')),
    );
  }
}

class BodyScaffold extends StatelessWidget {
  const BodyScaffold({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit, UsuarioState>(
      builder: (_, state) {
        /*if (state is UsuarioInitial) {
          return const Center(
            child: Text('No Hay informacion del usuario'),
          );
        } else if (state is UsuarioActivo) {
          return InformacionUsuario(usuario: state.usuario);
        } else {
          return const Center(
            child: Text('Estado no reconocido'),
          );
        }*/
        //Es mas eficiente el switch
        switch (state.runtimeType) {
          case UsuarioInitial:
            return const Center(
              child: Text('No Hay informacion del usuario'),
            );
          case UsuarioActivo:
            return InformacionUsuario(
                usuario: (state as UsuarioActivo).usuario);
          default:
            return const Center(
              child: Text('Estado no reconocido'),
            );
        }
      },
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;

  const InformacionUsuario({super.key, required this.usuario});

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
          ListTile(title: Text('Nombre: ${usuario.nombre}')),
          ListTile(title: Text('Edad: ${usuario.edad}')),
          Text('Profesiones',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
          ...usuario.profesiones.map((profesion) {
            return ListTile(
              title: Text(profesion),
              leading: Icon(Icons.work),
            );
          }).toList()
        ],
      ),
    );
  }
}
