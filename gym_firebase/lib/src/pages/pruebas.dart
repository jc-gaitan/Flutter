import 'package:flutter/material.dart';

class PruebaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MediaQueryData data = MediaQuery.of(context);

    double h = data.textScaleFactor;

    double screenWidth = data.size.width;
    double screenHeight = data.size.height;

    return MediaQuery(
      data: data.copyWith(textScaleFactor: 1.0),
      child: Center(
        child: Text(
          'Tamaño letra = $h \n Tamaño pantalla ancho = $screenWidth \n Tamaño pantalla ancho = $screenHeight \n Size = ${data.size}',
        ),
      ),
    );
  }
}
