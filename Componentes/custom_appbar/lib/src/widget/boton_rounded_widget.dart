import 'package:flutter/material.dart';

class BotonRoundedWidget extends StatelessWidget {
  final String text;
  final VoidCallback action;

  BotonRoundedWidget(this.text, this.action);

  @override
  Widget build(BuildContext context) {
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
}
