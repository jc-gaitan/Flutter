import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/chat_model.dart';
import 'package:whatsapp_clone/pages/chat_screend.dart';

class Chats extends StatefulWidget {
  @override
  _ChatsState createState() => new _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: messageData.length,
      itemBuilder: (context, i) => new Column(
        children: [
          new Divider(
            height: 10.0,
          ),
          new ListTile(
            leading: new CircleAvatar(
              backgroundImage: NetworkImage(messageData[i].imageUrl),
            ),
            title: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                new Text(
                  messageData[i].name,
                  style: new TextStyle(fontWeight: FontWeight.bold),
                ),
                new Text(
                  messageData[i].time,
                  style: new TextStyle(color: Colors.grey, fontSize: 14.0),
                ),
              ],
            ),
            subtitle: new Container(
              padding: const EdgeInsets.only(top: 5.0),
              child: new Text(
                messageData[i].message,
                style: new TextStyle(color: Colors.grey, fontSize: 15.0),
              ),
            ),
            onTap: () {
              var route = new MaterialPageRoute(
                  builder: (BuildContext context) =>
                      new ChatScreen(name: messageData[i].name));
              Navigator.of(context).push(route);
            },
          ),
        ],
      ),
    );
  }
}
