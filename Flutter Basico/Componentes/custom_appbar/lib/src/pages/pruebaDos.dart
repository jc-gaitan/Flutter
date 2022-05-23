import 'package:flutter/material.dart';

class PruebaDos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MediaQueryData data = MediaQuery.of(context);

    double h = data.textScaleFactor;

    double screenWidth = data.size.width;

    return MediaQuery(
      data: data.copyWith(textScaleFactor: 1.0),
      child: Center(
        child: Text(
          'Tamaño letra = $h \n Tamaño pantalla ancho = $screenWidth',
        ),
      ),
    );
  }
}
