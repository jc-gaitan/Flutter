import 'package:custom_appbar/src/pages/tab_page.dart';
import 'package:custom_appbar/src/pages/recuperar_password.dart';
import 'package:flutter/material.dart';

import 'package:custom_appbar/src/pages/login_page.dart';
import 'package:custom_appbar/src/pages/registro_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Custom AppBar',
      theme: ThemeData(
        fontFamily: 'Baloo 2',
        appBarTheme: AppBarTheme(
          brightness: Brightness.dark,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => LoginPage(),
        'registro': (BuildContext context) => RegistroPage(),
        'recuperar': (BuildContext context) => RecuperarPassword(),
        'home': (BuildContext context) => TabPage(),
      },
    );
  }
}
