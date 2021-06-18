import 'package:flutter/material.dart';

class SecondTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.red,
      body: new Container(
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new Icon(
                Icons.watch_later,
                size: 160.0,
                color: Colors.white,
              ),
              new Text(
                "Second tab",
                style: new TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
