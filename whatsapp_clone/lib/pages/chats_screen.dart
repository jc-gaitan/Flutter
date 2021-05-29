import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/chat_model.dart';

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
          ),
        ],
      ),
    );
  }
}
