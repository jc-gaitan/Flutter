import 'dart:io';
import 'dart:ui';

import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inventario/app/models/product_model.dart';
import 'package:inventario/app/providers/products_provider.dart';

class ProductsDetailController extends GetxController {
  //
  late ProductModel product;
  bool loading = false;
  late List<String> data;

  @override
  void onInit() async {
    product = Get.arguments;
    initData();
    super.onInit();
  }

  void initData() {
    data = [
      product.photoUrl,
      product.name,
      product.br,
      product.quantityE,
      product.price
    ];
  }

  void updateProduct() {
    for (var element in data) {
      if (element.isEmpty) {
        snack("ERROR", "NINGÚN DATO PUEDE ESTAR VACÍO");
        return;
      }
    }

    product.photoUrl = data[0];
    product.name = data[1];
    product.br = data[2];
    product.quantityE = data[3];
    product.price = data[4];

    //
    ProductsProvider.addProduct(product);
    snack("ÉXITO", "SE HA ACTUALIZADO EL PRODUCTO");
  }

  seleccionarFoto() async {
    _procesarImagen(ImageSource.gallery);
  }

  tomarFoto() async {
    _procesarImagen(ImageSource.camera);
  }

  _procesarImagen(ImageSource origen) async {
    XFile? img = await ImagePicker().pickImage(
      source: origen,
      imageQuality: 30,
    );

    if (img != null) {
      File? foto = File(img.path);
      //
      product.photoUrl = await ProductsProvider.uploadImg(product.br, foto);
      print(product.photoUrl);
      update(["productDetail"]);
    }
  }

  void snack(String title, String msg) {
    Get.snackbar(
      title,
      msg,
      colorText: const Color.fromRGBO(255, 255, 255, 1.0),
      snackPosition: SnackPosition.BOTTOM,
      isDismissible: true,
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
      duration: const Duration(milliseconds: 1000),
      backgroundColor: const Color.fromRGBO(46, 46, 46, 1.0),
    );
  }
}
