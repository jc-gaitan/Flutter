import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class CardSwiper extends StatelessWidget {
  final List<Pelicula> peliculas;

  CardSwiper({required this.peliculas});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.all(20.0),
      child: new Swiper(
        itemBuilder: (BuildContext context, int index) {
          peliculas[index].uniqueId = '${peliculas[index].id}-tarjeta';
          return Hero(
            tag: peliculas[index].uniqueId.toString(),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'detalle',
                    arguments: peliculas[index]),
                child: FadeInImage(
                  placeholder: AssetImage('assets/img/no-image.jpg'),
                  image: NetworkImage(peliculas[index].getPosterImg()),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
        itemCount: peliculas.length,
        //ocupa el 70% del ancho de la pantalla
        itemWidth: _screenSize.width * 0.7,
        itemHeight: _screenSize.height * 0.5,
        layout: SwiperLayout.STACK,
      ),
    );
  }
}
