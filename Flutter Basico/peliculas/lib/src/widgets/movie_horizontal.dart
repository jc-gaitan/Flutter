import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class MovieHorizontal extends StatelessWidget {
  final List<Pelicula> peliculas;
  final Function siguientePagina;

  MovieHorizontal({required this.peliculas, required this.siguientePagina});

  final _pageController = new PageController(
    initialPage: 1,
    viewportFraction: 0.3,
  );

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    _pageController.addListener(() {
      if (_pageController.position.pixels >=
          _pageController.position.maxScrollExtent - 200) {
        siguientePagina();
      }
    });

    return Container(
      height: _screenSize.height * 0.2,
      /*el pageview -> renderiza todos los elementos simultaneamente, 
      el pageview.builder renderiza los elementos cuando los necesite. */
      child: PageView.builder(
        pageSnapping: false,
        controller: _pageController,
        //children: _targetas(context),
        itemCount: peliculas.length,
        itemBuilder: (context, index) => _targeta(context, peliculas[index]),
      ),
    );
  }

  Widget _targeta(BuildContext context, Pelicula pelicula) {
    pelicula.uniqueId = '${pelicula.id}-poster';

    final targeta = Container(
      margin: EdgeInsets.only(right: 15.0),
      child: Column(
        children: [
          Hero(
            tag: pelicula.uniqueId.toString(),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: FadeInImage(
                placeholder: AssetImage('assets/img/no-image.jpg'),
                image: NetworkImage(pelicula.getPosterImg()),
                fit: BoxFit.cover,
                height: 100,
              ),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            _checkTitleSize(pelicula),
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );

    return GestureDetector(
      onTap: () {
        //print('titulo ${pelicula.title}');
        //pasar un objeto atravez de un pushNamed, se utiliza arguments
        Navigator.pushNamed(context, 'detalle', arguments: pelicula);
      },
      child: targeta,
    );
  }

  /*List<Widget> _targetas(BuildContext context) {
    return peliculas.map((pelicula) {
      return Container(
        margin: EdgeInsets.only(right: 15.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: FadeInImage(
                placeholder: AssetImage('assets/img/no-image.jpg'),
                image: NetworkImage(pelicula.getPosterImg()),
                fit: BoxFit.cover,
                height: 100,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              _checkTitleSize(pelicula),
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      );
    }).toList();
  }*/

  String _checkTitleSize(Pelicula pelicula) {
    String title = pelicula.title.toString();
    if (title.length > 14) {
      return title.substring(0, 14) + "...";
    } else {
      return title;
    }
  }
}
