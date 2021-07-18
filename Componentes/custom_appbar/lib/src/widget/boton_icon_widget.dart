import 'package:flutter/material.dart';

class BotonIconWidget extends StatelessWidget {
  final String text;
  final String rutaIcon;

  BotonIconWidget(this.text, this.rutaIcon);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton.icon(
        icon: Image.asset(
          rutaIcon,
          width: 24.0,
          height: 24.0,
          fit: BoxFit.cover,
        ),
        onPressed: () {},
        label: Text(text),
        style: ElevatedButton.styleFrom(
          //color de boton
          primary: Color.fromRGBO(73, 73, 73, 1.0),
          //estilo
          shape: StadiumBorder(),
          //padding
          padding: EdgeInsets.symmetric(vertical: 10.0),
        ),
      ),
    );
  }
}
