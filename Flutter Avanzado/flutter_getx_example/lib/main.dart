import 'package:flutter/material.dart';
import 'package:flutter_getx_example/pages/pagina1_page.dart';
import 'package:flutter_getx_example/pages/pagina2_page.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/pagina1',
      /*routes: {
        'pagina1': (_) => Pagina1Page(),
        'pagina2': (_) => Pagina2Page(),
      },*/
      getPages: [
        //permite inyeccion de dependencias y otras cosas
        GetPage(name: '/pagina1', page: () => Pagina1Page()),
        GetPage(name: '/pagina2', page: () => Pagina2Page()),
      ],
    );
  }
}
