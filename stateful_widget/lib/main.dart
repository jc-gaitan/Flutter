import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: myButton(),
  ));
}

class myButton extends StatefulWidget {
  @override
  _myButtonState createState() => new _myButtonState();
}

class _myButtonState extends State<myButton> {
  String text = "";
  int index = 0;
  List<String> collections = ["flutter", "es", "genial"];

  void onPressButton() {
    setState(() {
      text = collections[index];
      index = index < 2 ? index + 1 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Stateful Widget"),
        backgroundColor: Colors.orangeAccent,
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new Text(
                text,
                style: new TextStyle(fontSize: 40.0),
              ),
              new Padding(padding: new EdgeInsets.all(10.0)),
              new RaisedButton(
                child: new Text("Actualizar",
                    style: new TextStyle(color: Colors.white)),
                color: Colors.blueAccent,
                onPressed: onPressButton,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
