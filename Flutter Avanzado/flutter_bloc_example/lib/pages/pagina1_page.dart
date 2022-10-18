import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/bloc/user/user_bloc.dart';
import 'package:flutter_bloc_example/models/usuario.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              BlocProvider.of<UserBloc>(context, listen: false)
                  .add(DeleteUserEvent());
            },
          ),
        ],
      ),
      //cada vez que hay un cambio en UserState, se reconstruye el widget
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return state.existUser
              ? InformacionUsuario(
                  user: state.user!,
                )
              : const Center(
                  child: Text('No hay usuario seleccionado'),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.accessibility_new),
          onPressed: () => Navigator.pushNamed(context, 'pagina2')),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario user;

  const InformacionUsuario({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('General',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
          ListTile(title: Text('Nombre: ${user.nombre}')),
          ListTile(title: Text('Edad: ${user.edad}')),
          const Text('Profesiones',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
          ...user.profesiones.map((profesion) {
            return ListTile(
              title: Text(profesion),
            );
          }).toList(),
        ],
      ),
    );
  }
}
