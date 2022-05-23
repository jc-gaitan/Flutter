import 'package:flutter/material.dart';

/* Textos del login y el registro */

class TextoLRWidget extends StatelessWidget {
  final String text;
  final Alignment alignment;
  final Color color;
  final String ruta;

  TextoLRWidget(this.text, this.alignment, this.color, this.ruta);

  @override
  Widget build(BuildContext context) {
    return Container(
      //alineado a la izquierda
      alignment: alignment,
      //padding: EdgeInsets.only(right: 12.0),
      child: InkWell(
        onTap: () => (ruta.isEmpty) ? null : _navegation(context, ruta),
        child: Text(text,
            style: TextStyle(
              color: color,
              fontSize: 16.0,
              //fontWeight: FontWeight.bold,
            )),
      ),
    );
  }

  void _navegation(BuildContext context, String ruta) {
    if (ruta == 'pop') {
      Navigator.pop(context);
    } else {
      Navigator.pushNamed(context, ruta);
    }
    //print('Registrarse');
  }
}
