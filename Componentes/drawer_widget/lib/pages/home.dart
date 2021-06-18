import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  Drawer _getDrawer(BuildContext context) {
    var header = new DrawerHeader(
      child: new Text("Ajustes"),
    );

    var info = new AboutListTile(
      child: new Text("Informacion App"),
      applicationVersion: "V1.0.0",
      applicationName: "Demo Menu",
      applicationIcon: new Icon(Icons.favorite),
      icon: new Icon(Icons.info),
    );

    ListTile _getItem(Icon icon, String desc, String route) {
      return new ListTile(
        leading: icon,
        title: new Text(desc),
        onTap: () {
          setState(() {
            Navigator.of(context).pushNamed(route);
          });
        },
      );
    }

    ListView listView = new ListView(
      children: [
        header,
        _getItem(new Icon(Icons.settings), "Configuracion", "/configuracion"),
        _getItem(new Icon(Icons.home), "Home", "/"),
        _getItem(new Icon(Icons.battery_full), "Bateria", "/battery"),
        info,
      ],
    );

    return new Drawer(
      child: listView,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Demo Menu"),
      ),
      drawer: _getDrawer(context),
    );
  }
}
