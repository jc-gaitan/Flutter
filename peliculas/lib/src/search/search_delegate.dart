import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';

class DataSearch extends SearchDelegate {
  final peliculasProvider = new PeliculasProvider();

  String seleccion = '';

  final peliculas = [
    'Spiderman',
    'Capitan America',
    'Shazan',
    'Venux',
    'Superman',
    'IronMan 2'
  ];

  final peliculasRecientes = ['Spiderman', 'Capitan America'];

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

  @override
  Widget buildSuggestions(BuildContext context) {
    //Son las sugerencias que aparecen cuando la persona escribe

    /*final listaSugeria = (query.isEmpty)
        ? peliculasRecientes
        : peliculas
            .where((p) => p.toLowerCase().startsWith(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: listaSugeria.length,
      itemBuilder: (context, i) {
        return ListTile(
          leading: Icon(Icons.movie),
          title: Text(listaSugeria[i]),
          onTap: () {
            seleccion = listaSugeria[i];
            showResults(context);
          },
        );
      },
    );
  }*/

    if (query.isEmpty) {
      return Container();
    } else {
      return FutureBuilder(
        future: peliculasProvider.buscarPelicula(query),
        builder:
            (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {
          if (snapshot.hasData) {
            final peliculas = snapshot.data;

            return ListView(
              children: peliculas!.map((pelicula) {
                return ListTile(
                  leading: FadeInImage(
                    image: NetworkImage(pelicula.getPosterImg()),
                    placeholder: AssetImage('assets/img/no-image.jpg'),
                    width: 50,
                    fit: BoxFit.contain,
                  ),
                  title: Text(pelicula.title.toString()),
                  subtitle: Text(pelicula.originalTitle.toString()),
                  onTap: () {
                    close(context, null);
                    pelicula.uniqueId = '';
                    Navigator.pushNamed(context, 'detalle',
                        arguments: pelicula);
                  },
                );
              }).toList(),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );
    }
  }
}
