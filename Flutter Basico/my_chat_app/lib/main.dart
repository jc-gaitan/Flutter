import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_chat_app/config/routes/app_pages.dart';
import 'package:my_chat_app/pages/login_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //bloquear giro de pantalla
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await Supabase.initialize(
    url: 'https://enzjaauaphbmzhjotjez.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVuemphYXVhcGhibXpoam90amV6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2Nzg4MjEzNzEsImV4cCI6MTk5NDM5NzM3MX0.73iNzTfmtouqrv4dGWIk0yIPDAh-BjtJAXEeC7_XJU4',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //ignora el tamaño del texto del sistema
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      },

      debugShowCheckedModeBanner: false,
      title: 'Chat App',
      //theme: AppBasicTheme.getThemeDataLight(), //ThemeData.dark(),
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      unknownRoute: GetPage(name: '/notfound', page: () => LoginPage()),
    );
  }
}
