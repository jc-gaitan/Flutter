import 'package:flutter/material.dart';

Widget fondo() {
  return Center(
      child: Container(
    width: double.infinity,
    height: double.infinity,
    child: Image(
      image: AssetImage("assets/fondo.png"),
      fit: BoxFit.cover,
    ),
  ));
}
