import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getx_example/view/home.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Getx Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.deepPurple),
      home: Home(),
    );
  }
}
