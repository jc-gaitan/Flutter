import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Column(
        children: [
          new Icon(
            Icons.home,
            size: 170.0,
            color: Colors.blueAccent,
          ),
          new Text("Primer Tab"),
        ],
      ),
    );
  }
}
