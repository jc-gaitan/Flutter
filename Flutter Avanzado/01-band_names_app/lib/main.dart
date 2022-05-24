//primero paquetes de flutter
import 'package:band_names_app/services/socket_service.dart';
import 'package:flutter/material.dart';

//segundo paquetes de terceros
import 'package:provider/provider.dart';

//tercero mis paquetes
import 'package:band_names_app/pages/home.dart';
import 'package:band_names_app/pages/status_server.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SocketService(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'status',
        routes: {
          'home': (context) => const HomePage(),
          'status': (context) => StatusPage(),
        },
      ),
    );
  }
}
