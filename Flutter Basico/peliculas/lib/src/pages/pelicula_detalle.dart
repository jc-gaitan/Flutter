import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:peliculas/src/models/actores_model.dart';
import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';

class PeliculaDetalle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //guardar el objeto enviado atravez del pushNamed
    final Pelicula pelicula =
        ModalRoute.of(context)!.settings.arguments as Pelicula;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _crearAppBar(pelicula),
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(height: 10.0),
              _posterTitulo(pelicula, context),
              _descripcion(pelicula),
              _descripcion(pelicula),
              _descripcion(pelicula),
              _descripcion(pelicula),
              _crearCasting(pelicula),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _actorTarjeta(Actor actor) {
    return Container(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
              placeholder: AssetImage('assets/img/no-image.jpg'),
              image: NetworkImage(actor.getFoto()),
              fit: BoxFit.cover,
              height: 150,
              fadeInDuration: Duration(milliseconds: 150),
            ),
          ),
          Text(
            actor.name.toString(),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _crearActoresPageView(List<Actor>? actores) {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        pageSnapping: false,
        itemCount: actores?.length,
        controller: PageController(
          viewportFraction: 0.3,
          initialPage: 1,
        ),
        itemBuilder: (context, index) => _actorTarjeta(actores![index]),
      ),
    );
  }

  Widget _crearCasting(Pelicula pelicula) {
    final peliProvider = new PeliculasProvider();

    return FutureBuilder(
      future: peliProvider.getCast(pelicula.id.toString()),
      builder: (BuildContext context, AsyncSnapshot<List<Actor>> snapshot) {
        if (snapshot.hasData) {
          return _crearActoresPageView(snapshot.data);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _descripcion(Pelicula pelicula) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Text(
        pelicula.overview!,
        //justificar el texto
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _posterTitulo(Pelicula pelicula, BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Hero(
            tag: pelicula.uniqueId.toString(),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image(
                image: NetworkImage(pelicula.getPosterImg()),
                height: 150,
              ),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(pelicula.title!,
                    style: Theme.of(context).textTheme.headline4,
                    overflow: TextOverflow.ellipsis),
                Text(
                  pelicula.originalTitle!,
                  style: Theme.of(context).textTheme.headline6,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Icon(Icons.star_border),
                    SizedBox(
                      width: 2.0,
                    ),
                    Text(
                      pelicula.voteAverage.toString(),
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _crearAppBar(Pelicula pelicula) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigoAccent,
      //anchod del appbar
      expandedHeight: 200.0,
      floating: false,
      //mantiene visible cuando se esta haciendo el scroll
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(pelicula.title.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            )),
        background: FadeInImage(
          placeholder: AssetImage('assets/img/loading.gif'),
          image: NetworkImage(pelicula.getBackgroundImg()),
          fit: BoxFit.cover,
          height: 100,
          fadeInDuration: Duration(milliseconds: 150),
        ),
      ),
    );
  }
}
