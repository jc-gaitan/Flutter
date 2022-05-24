import 'package:flutter/material.dart';

import 'package:gym_firebase/src/bloc/provider.dart';
import 'package:gym_firebase/src/pages/login_page.dart';
import 'package:gym_firebase/src/pages/registro_page.dart';
import 'package:gym_firebase/src/pages/tab_page.dart';
import 'package:gym_firebase/src/preferencias_usuario/preferencias_usuario.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  //preferencias del usuario
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          //const Locale('en', ''), // English, no country code
          const Locale('es', ''), // Spanish, no country code
        ],
        locale: const Locale('es'),
        debugShowCheckedModeBanner: false,
        title: 'App Gym',
        theme: ThemeData(
          fontFamily: 'Baloo 2',
          appBarTheme: AppBarTheme(
            brightness: Brightness.dark,
          ),
          //color cuando sale un error en la app
          errorColor: Color.fromRGBO(227, 20, 20, 1.0),
        ),
        initialRoute: '/',
        routes: {
          '/': (BuildContext context) => LoginPage(),
          'registro': (BuildContext context) => RegistroPage(),
          'home': (BuildContext context) => TabPage(),
        },
      ),
    );
  }
}
