import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/estado_model.dart';

class Estado extends StatefulWidget {
  @override
  _EstadoState createState() => new _EstadoState();
}

class _EstadoState extends State<Estado> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView(
        children: [
          new ListTile(
            leading: new CircleAvatar(
              foregroundColor: Theme.of(context).accentColor,
              backgroundColor: Colors.grey,
              backgroundImage: new NetworkImage(estados[0].imgUrl),
            ),
            title: new Text(
              estados[0].name,
              style: new TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: new Text(
              "Añadir mi estado",
            ),
          ),
          new Text(
            "Recientes",
            style: new TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor),
          ),
          new Divider(),
          new ListTile(
            leading: new CircleAvatar(
              foregroundColor: Theme.of(context).accentColor,
              backgroundColor: Colors.grey,
              backgroundImage: new NetworkImage(estados[1].imgUrl),
            ),
            title: new Text(
              estados[1].name,
              style: new TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: new Text(
              "Añadir mi estado",
            ),
          ),
          new Divider(),
          new ListTile(
            leading: new CircleAvatar(
              foregroundColor: Theme.of(context).accentColor,
              backgroundColor: Colors.grey,
              backgroundImage: new NetworkImage(estados[2].imgUrl),
            ),
            title: new Text(
              estados[2].name,
              style: new TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: new Text(
              "Añadir mi estado",
            ),
          ),
        ],
      ),
    );
  }
}
