import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:powergym/app/config/routes/app_pages.dart';
import 'package:powergym/app/config/themes/app_basic_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
      //
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.initial,
      title: 'SurtyR&G',
      theme: AppBasicTheme.getThemeData(),
      getPages: AppPages.routes,
    );
  }
}
