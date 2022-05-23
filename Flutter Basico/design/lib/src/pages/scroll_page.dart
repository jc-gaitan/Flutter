import 'package:flutter/material.dart';

class ScrollPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      children: [
        _pagina1(),
        _pagina2(),
      ],
    );
  }

  Widget _pagina1() {
    return Stack(
      children: [
        _colorFondo(),
        _imagenFondo(),
        _textos(),
      ],
    );
  }

  Widget _textos() {
    final estiloTexto = TextStyle(
      color: Colors.white,
      fontSize: 50.0,
      decoration: TextDecoration.none,
    );
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 20.0,
          ),
          Text(
            "11°",
            style: estiloTexto,
          ),
          Text(
            "Miercoles",
            style: estiloTexto,
          ),
          Expanded(child: Container()),
          Icon(
            Icons.keyboard_arrow_down,
            color: Colors.white,
            size: 70.0,
          ),
        ],
      ),
    );
  }

  Widget _colorFondo() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(108, 192, 218, 1.0),
    );
  }

  Widget _imagenFondo() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image(
        image: AssetImage("assets/img.png"),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _pagina2() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(108, 192, 218, 1.0),
      child: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Text(
              'Bienvenido',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                decoration: TextDecoration.none,
              ),
            ),
          ),
          style: ElevatedButton.styleFrom(shape: StadiumBorder()),
        ),
      ),
    );
  }
}
