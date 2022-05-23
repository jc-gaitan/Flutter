import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "Mi primera App",
    home: new Scaffold(
      appBar: new AppBar(
        title: new Text("Mi primera App"),
      ),
      body: new Container(
        child: new Center(child: new Text("Hola Mundo")),
      ),
    ),
  ));
}
