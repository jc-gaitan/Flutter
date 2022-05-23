//primero paquetes de flutter
import 'package:flutter/material.dart';

//segundo paquetes de terceros

//tercero mis paquetes
import 'package:band_names_app/pages/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home': (context) => const HomePage(),
      },
    );
  }
}
