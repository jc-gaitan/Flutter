import 'package:flutter/services.dart' show rootBundle;

import 'dart:convert';

class _MenuProvider {
  List<dynamic> opciones = [];

  _MenuProvider() {
    //cargaData();
  }

  Future<List<dynamic>> cargaData() async {
    //para leer un archivo json necesitamos el paquete rootBundle de services
    var res = await rootBundle.loadString('data/menu_opts.json');

    Map dataMap = json.decode(res);

    //print(dataMap);
    //opciones = dataMap['rutas'];

    return dataMap['rutas'];
  }
}

final menuProvider = new _MenuProvider();
