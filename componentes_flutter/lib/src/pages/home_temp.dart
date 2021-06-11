import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco', 'Seis'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Componentes TEMP"),
      ),
      //es como si fuera un scroll
      body: ListView(
        //children: _crearItems(),
        children: _crearItemsCorta(),
      ),
    );
  }

  /*List<Widget> _crearItems() {
    List<Widget> lista = <Widget>[];

    for (String item in opciones) {
      final tempWidget = ListTile(
        title: Text(item),
      );

      lista..add(tempWidget)..add(Divider());
    }

    return lista;
  }*/

  List<Widget> _crearItemsCorta() {
    return opciones.map((item) {
      return Column(
        children: [
          ListTile(
            title: Text(item + '!'), //titulo
            subtitle: Text("Cualquier Cosas"), //subtitulo
            leading: Icon(Icons.ac_unit), //widget que se coloca al inicio
            trailing: Icon(
                Icons.keyboard_arrow_right), //widget que se coloca al final
            onTap: () {},
          ),
          Divider(),
        ],
      );
    }).toList();
  }
}
