import 'package:flutter/material.dart';

Widget buttonIcon(String text, String rutaIcon, VoidCallback action) {
  return Expanded(
    child: ElevatedButton.icon(
      icon: Image.asset(
        rutaIcon,
        width: 24.0,
        height: 24.0,
        fit: BoxFit.cover,
      ),
      onPressed: action,
      label: Text(text),
      style: ElevatedButton.styleFrom(
        //color de boton
        primary: Color.fromRGBO(73, 73, 73, 1.0),
        //estilo
        shape: StadiumBorder(),
        //padding
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 3.0),
      ),
    ),
  );
}
