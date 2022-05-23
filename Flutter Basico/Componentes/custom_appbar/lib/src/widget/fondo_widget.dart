import 'package:flutter/material.dart';

class FondoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
}
