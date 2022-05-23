import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new First(),
  ));
}

class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Primera pantalla"),
      ),
      body: new Center(
        child: new RaisedButton(
          child: new Text("Mostrar Pantalla"),
          onPressed: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new Second()));
          },
        ),
      ),
    );
  }
}

class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Segunda pantalla"),
      ),
      body: new Center(
        child: new RaisedButton(
            child: new Text("Ir atras"),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
    );
  }
}
