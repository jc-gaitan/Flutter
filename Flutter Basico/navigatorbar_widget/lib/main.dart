import 'package:flutter/material.dart';
import 'package:navigatorbar_widget/pages/frist.dart';
import 'package:navigatorbar_widget/pages/Second.dart';
import 'package:navigatorbar_widget/pages/Third.dart';

void main() {
  runApp(new MaterialApp(
    home: MyNavegator(),
  ));
}

class MyNavegator extends StatefulWidget {
  @override
  _MyNavegatorState createState() => new _MyNavegatorState();
}

class _MyNavegatorState extends State<MyNavegator>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("demo Botton Navegator Bar"),
      ),
      body: new TabBarView(
        children: <Widget>[
          new FristTab(),
          new SecondTab(),
          new ThirdTab(),
        ],
        controller: this.controller,
      ),
      bottomNavigationBar: new Material(
        color: Colors.blueAccent,
        child: new TabBar(
          tabs: [
            new Tab(
              icon: new Icon(Icons.alarm),
            ),
            new Tab(
              icon: new Icon(Icons.watch_later),
            ),
            new Tab(
              icon: new Icon(Icons.airplanemode_active),
            ),
          ],
          controller: this.controller,
        ),
      ),
    );
  }
}
