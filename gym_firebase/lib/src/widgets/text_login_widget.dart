import 'package:flutter/material.dart';

Widget textLogin(String text, double size, Alignment alignment, Color color,
    VoidCallback action) {
  return Container(
    //alineado a la izquierda
    alignment: alignment,
    //padding: EdgeInsets.only(right: 12.0),
    child: InkWell(
      onTap: action,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: size,
          shadows: [
            Shadow(
              color: Colors.black,
              offset: Offset(3.0, 3.0),
              blurRadius: 5.0,
            ),
          ],
          //fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
