import 'package:flutter/material.dart';

class Contac extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Column(
        children: [
          new Icon(
            Icons.contacts,
            size: 170.0,
            color: Colors.grey,
          ),
          new Text("Tercera Tab"),
        ],
      ),
    );
  }
}
