import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventario/models/client_model.dart';

class DetailClientController extends GetxController {
  late ClientModel client;

  late List<TextEditingController> data;

  RxBool isExpanded = false.obs;

  @override
  void onInit() {
    client = Get.arguments;
    initData();

    super.onInit();
  }

  void initData() {
    data = [
      TextEditingController(text: client.email),
      TextEditingController(text: client.name),
      TextEditingController(text: client.phone),
    ];
  }

  void save() async {
    /*for (var element in data) {
      if (element.text.isEmpty) {
        snackbar('FALLO', 'Ninguna campo puede estar vacio');
        return;
      }
    }
    product.br = bc.value;
    product.name = data[0].text.toUpperCase();
    product.price = data[1].text;
    product.quantityE = data[2].text;

    ProgressDialog pd = ProgressDialog(context: Get.context);
    pd.show(
      max: 100,
      msg: 'Guardando...',
      barrierColor: Colors.black54.withOpacity(0.3),
    );

    await ProductsProvider.addProduct(product);

    pd.close();*/
  }
}
