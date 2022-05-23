import 'package:flutter/material.dart';

Widget buttonRounded(String text, VoidCallback action) {
  return Expanded(
    child: ElevatedButton(
      onPressed: action,
      child: Text(text),
      style: ElevatedButton.styleFrom(
        //color de boton
        primary: Color.fromRGBO(73, 73, 73, 1.0),
        //estilo
        shape: StadiumBorder(),
        //padding
        padding: EdgeInsets.symmetric(vertical: 15.0),
      ),
    ),
  );
}
