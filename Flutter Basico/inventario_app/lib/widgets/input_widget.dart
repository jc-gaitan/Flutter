import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  //
  const InputWidget(
      {required this.text,
      required this.type,
      required this.controller,
      Key? key})
      : super(key: key);

  final String text;
  final TextInputType type;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        Positioned(
          top: 5.0,
          left: 30.0,
          child: Text(
            text,
            style: const TextStyle(fontSize: 14.0, color: Colors.grey),
          ),
        ),
        Positioned(
          left: 30.0,
          bottom: 3.0,
          right: 30.0,
          child: TextField(
            controller: controller,
            keyboardType: type,
            decoration:
                const InputDecoration(border: InputBorder.none, hintText: ''),
            /*onChanged: (s) {
              text = s;
            },*/
          ),
        )
      ],
    );
  }
}
