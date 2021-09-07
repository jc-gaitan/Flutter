import 'package:flutter/material.dart';
import 'package:gym_firebase/src/models/nutricion_model.dart';

class DataSearch extends SearchDelegate {
  List<ComidaModel> comidas;

  DataSearch(this.comidas);

  String seleccion = '';

  @override
  List<Widget> buildActions(BuildContext context) {
    //Acciones de nuestro AppBar
    return [
      IconButton(
        onPressed: () {
          //variable que manejas el search -> texto que escribe el usuario
          query = '';
        },
        icon: Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //icono a la izquierda del AppBar
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          //tiempo en el que se anima el icono
          progress: transitionAnimation,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    //Crear los resultados que vamosa mostrar
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        color: Colors.blueAccent,
        child: Text(seleccion),
      ),
    );
  }

  List<ComidaModel> buscar(String query) {
    List<ComidaModel> busqueda = [];
    RegExp regExp = new RegExp(
      query,
      caseSensitive: false,
      multiLine: false,
    );
    comidas.forEach((element) {
      if (regExp.hasMatch(element.nombre.toLowerCase())) {
        print(element.nombre);
        print(regExp);
        busqueda.add(element);
      }
    });
    return busqueda;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container();
    } else {
      List<ComidaModel> com = buscar(query);
      if (com.length > 0) {
        return ListView(
          children: com.map((comida) {
            return ListTile(
              leading: FadeInImage(
                image: NetworkImage(comida.urlFoto),
                placeholder: AssetImage('assets/img/no-image.jpg'),
                width: 50,
                fit: BoxFit.contain,
              ),
              title: Text(comida.nombre),
              onTap: () {
                close(context, null);
                comida.id = '';
                Navigator.pushNamed(context, 'detalle', arguments: comida);
              },
            );
          }).toList(),
        );
      } else {
        return Container(
          //height: 500,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
    }
  }
}
