import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: MySnackBar(),
  ));
}

class MySnackBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("SnackBar Demo"),
      ),
      body: new Center(
        child: new MyButton(),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      child: new Text("Desplegar SnackBar"),
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
          content: new Text("Hola soy un SnackBar :) "),
          duration: new Duration(seconds: 5),
          action: new SnackBarAction(
              label: "Clic Aqui",
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    new SnackBar(content: new Text("HOla nuevamente")));
              }),
        ));
      },
    );
  }
}
