import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inventario/models/product_model.dart';
import 'package:inventario/providers/products_provider.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class DetailProductController extends GetxController {
  late ProductModel product;
  RxInt x = 1.obs;

  RxString photoUrl = ''.obs;

  late List<TextEditingController> data;
  RxString bc = 'Unknown'.obs;

  @override
  void onInit() {
    product = Get.arguments;
    photoUrl.value = product.photoUrl;
    initData();

    super.onInit();
  }

  void initData() {
    data = [
      TextEditingController(text: product.name),
      TextEditingController(text: product.price),
      TextEditingController(text: product.quantityE),
    ];

    bc.value = product.br;
  }

  void save() async {
    for (var element in data) {
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

    pd.close();
  }

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      //print(bc.value);
    } on PlatformException {
      //bc.value = 'Failed to get platform version.';
      barcodeScanRes = 'Unknown';
    }

    verifCodeBar(barcodeScanRes);
  }

  void verifCodeBar(String code) async {
    if (code == '-1') {
      bc.value = product.br;
    } else {
      ProgressDialog pd = ProgressDialog(context: Get.context);
      pd.show(
        max: 100,
        msg: 'Verificando...',
        barrierColor: Colors.black54.withOpacity(0.3),
      );

      ProductModel? p = await ProductsProvider.getProduct(code);

      pd.close();

      if (p != null) {
        snackbar('FALLO', 'Ya exite un producto con este codigo de barras');
        bc.value = product.br;
      } else {
        bc.value = code;
      }
    }
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
      ProgressDialog pd = ProgressDialog(context: Get.context);
      pd.show(
        max: 100,
        msg: 'Subiendo imagen...',
        barrierColor: Colors.black54.withOpacity(0.3),
      );

      photoUrl.value = await ProductsProvider.uploadImg(product.br, foto);

      //actualizar producto
      await ProductsProvider.updateImg(product.br, photoUrl.value);

      //
      pd.close();
    }
  }

  void snackbar(String title, String msg) {
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
