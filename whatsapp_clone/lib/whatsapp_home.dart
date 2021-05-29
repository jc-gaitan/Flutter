import 'package:flutter/material.dart';
import 'package:whatsapp_clone/pages/camara.dart';
import 'package:whatsapp_clone/pages/chats_screen.dart';
import 'package:whatsapp_clone/pages/estados_screen.dart';
import 'package:whatsapp_clone/pages/llamadas_screen.dart';

class WhatsAppHome extends StatefulWidget {
  @override
  _WhatsAppHomeState createState() => new _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(initialIndex: 1, length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("FlutterChat"),
        bottom: new TabBar(controller: _tabController, tabs: <Widget>[
          new Tab(
            icon: new Icon(Icons.camera_alt),
          ),
          new Tab(
            text: "CHATS",
          ),
          new Tab(
            text: "ESTADOS",
          ),
          new Tab(
            text: "LLAMADAS",
          ),
        ]),
      ),
      body: new TabBarView(controller: _tabController, children: <Widget>[
        new Camara(),
        new Chats(),
        new Estados(),
        new Llamadas(),
      ]),
    );
  }
}
