import 'package:flutter/material.dart';
import 'package:prueba/log/logs.dart';

import 'pages/Home.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

//var logger = Logger();

final logFilename = 'logs.txt';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    print("Es web");
  } else {
    print("Es movil o desktop");
    // NOT running on the web! You can check for additional platforms here.
    await Logs.initializeLogging(logFilename);

    await Logs.log('Iniciando app');
    await Logs.log('asd');
    await Logs.log('prueba');
    //await Logs.log('ENTERED main() ...');

    //saber el sistema operativo en el que se ejecuta la app
    /*print(Platform.isAndroid);
    print(Platform.isWindows);
    print(Platform.isMacOS);
    print(Platform.isFuchsia);
    print(Platform.isIOS);
    print(Platform.isLinux);*/
  }

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
