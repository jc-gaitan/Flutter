import 'package:flutter/material.dart';
import 'package:flutter_getx_example/controllers/usuario_controller.dart';
import 'package:get/get.dart';

import '../models/usuario.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Inyeccion de dependecias
    final usuarioCtrl = Get.put(UsuarioController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
      ),
      body: Obx((() => usuarioCtrl.existeUsuario.value
          ? InformacionUsuario(
              usuario: usuarioCtrl.usuario.value,
            )
          : NoInfo())),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new),
        //onPressed: () => Navigator.pushNamed(context, 'pagina2')),
        onPressed: () =>
            Get.toNamed('pagina2', preventDuplicates: true, arguments: {
          'nombre': 'Juan',
          'edad': 30,
        }),
      ),
    );
  }
}

class NoInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('No hay informacion'),
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
          ...usuario.profesiones.map((e) => ListTile(title: Text(e))).toList()
        ],
      ),
    );
  }
}
