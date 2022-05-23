import 'package:flutter/material.dart';

import 'package:design/src/pages/basic_page.dart';
import 'package:design/src/pages/scroll_page.dart';
import 'package:design/src/pages/botones_page.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //cambiar el color del statusbar a blanco
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.white,
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños',
      initialRoute: 'botones',
      routes: {
        'basic': (BuildContext context) => BasicPage(),
        'scroll': (BuildContext context) => ScrollPage(),
        'botones': (BuildContext context) => BotonesPage(),
      },
    );
  }
}
