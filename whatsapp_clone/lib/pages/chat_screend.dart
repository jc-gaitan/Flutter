import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String name;
  ChatScreen({required this.name});

  @override
  _ChatScreenState createState() => new _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final TextEditingController _textController = new TextEditingController();

  Widget _builderTextComposer() {
    return new Container(
      child: new Row(
        children: [
          new Flexible(
              child: new TextField(
            controller: _textController,
          )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.name),
      ),
      body: new Container(
        child: new Column(
          children: [
            new Container(
              child: _builderTextComposer(),
            ),
          ],
        ),
      ),
    );
  }
}
