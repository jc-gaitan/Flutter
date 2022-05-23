import 'package:flutter/material.dart';

class BasicPage extends StatelessWidget {
  final estiloTitulo = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final estiloSubtitulo = TextStyle(fontSize: 16.0, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _crearImagen(),
              _crearTitulo(),
              _crearAcciones(),
              _crearText(),
              _crearText(),
              _crearText(),
              _crearText(),
              _crearText(),
              _crearText(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage(
          'https://www.adorama.com/alc/wp-content/uploads/2018/11/landscape-photography-tips-yosemite-valley-feature.jpg'),
    );
  }

  Widget _crearTitulo() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Lago',
                  style: estiloTitulo,
                ),
                SizedBox(
                  height: 7.0,
                ),
                Text(
                  'Un lago en alemania',
                  style: estiloSubtitulo,
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.redAccent,
            size: 30.0,
          ),
          Text(
            '41',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _crearAcciones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _crearAccion(Icons.call, 'Call'),
        _crearAccion(Icons.near_me, "Route"),
        _crearAccion(Icons.share, "Shared"),
      ],
    );
  }

  Widget _crearAccion(IconData icon, String text) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.blue,
          size: 40.0,
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(text,
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.blue,
            )),
      ],
    );
  }

  Widget _crearText() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
      child: Text(
        "Enim veniam occaecat officia velit id et consequat culpa anim dolore ullamco laboris in tempor. Aliqua consectetur laboris anim id ad aliqua aliqua aliqua excepteur incididunt et nostrud Lorem. Deserunt Lorem anim sint aute officia occaecat irure ea excepteur veniam. Culpa labore dolor magna cillum dolor consequat. Laboris quis Lorem incididunt adipisicing. Ex veniam nulla amet dolore ullamco proident ex deserunt excepteur.",
        textAlign: TextAlign.justify,
      ),
    );
  }
}
