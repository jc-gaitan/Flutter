import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:surtyrg/app/config/routes/app_pages.dart';
import 'package:surtyrg/app/config/themes/app_basic_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.initial,
      title: 'SurtyR&G',
      theme: AppBasicTheme.getThemeData(),
      getPages: AppPages.routes,
    );
  }
}
