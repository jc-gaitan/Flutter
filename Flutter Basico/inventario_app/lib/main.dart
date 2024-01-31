import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:inventario/config/routes/app_pages.dart';
import 'package:inventario/config/themes/app_basic_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //bloquear giro de pantalla
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  //await Firebase.initializeApp();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.initial,
      title: 'Inventario',
      theme: AppBasicTheme.getThemeData(),
      getPages: AppPages.routes,
    );
  }
}
