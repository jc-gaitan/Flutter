import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui/config/routes/app_pages.dart';
import 'package:flutter_ui/config/themes/app_basic_theme.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //bloquear giro de pantalla
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.initial,
      title: 'Flutter get ui',
      theme: AppBasicTheme.getThemeData(),
      getPages: AppPages.routes,
    );
  }
}
