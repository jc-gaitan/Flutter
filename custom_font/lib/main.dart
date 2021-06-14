import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

//informacion sobre custom fonts:
//https://flutter.dev/docs/cookbook/design/fonts

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Fonts',
      //poner tipo de letra por defecto en la app
      //theme: ThemeData(fontFamily: 'Baloo 2'),
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Text(
                "Baloo 2 - Regular",
                //llamarla en un widget
                style: TextStyle(fontFamily: 'Baloo 2', fontSize: 38),
              ),
              Text(
                "Baloo 2 - Bold",
                style: TextStyle(
                    fontFamily: 'Baloo 2',
                    fontSize: 38,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                "Baloo 2 - SemiBold",
                style: TextStyle(
                    fontFamily: 'Baloo 2',
                    fontSize: 38,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                "Baloo 2 - Medium",
                style: TextStyle(
                    fontFamily: 'Baloo 2',
                    fontSize: 38,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                "regular letra por defecto flutter",
                style: TextStyle(fontSize: 38),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
