import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inventario/models/product_model.dart';
import 'package:inventario/providers/products_provider.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class CreateProductController extends GetxController {
  //
  RxString bc = 'Unknown'.obs;
  RxBool frist = true.obs;

  RxString photoUrl = ''.obs;
  RxBool selectedImg = false.obs;

  List<TextEditingController> data = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  void deleteImg() async {
    await ProductsProvider.deleteImg(bc.value);

    Get.back();
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

      ProgressDialog pd = ProgressDialog(context: Get.context);
      pd.show(
        max: 100,
        msg: 'Subiendo imagen...',
        barrierColor: Colors.black54.withOpacity(0.3),
      );

      photoUrl.value = await ProductsProvider.uploadImg(bc.value, foto);
      selectedImg.value = true;

      //
      pd.close();
    }
  }

  void save() async {
    int x = 0;
    for (var element in data) {
      if (element.text.isNotEmpty) {
        x++;
      }
    }
    if (x == 3) {
      ProductModel product = ProductModel(
        name: data[0].text.toUpperCase(),
        br: bc.value,
        price: data[2].text,
        quantityE: data[1].text,
        quantitySold: '0',
        photoUrl: photoUrl.value,
      );

      ProgressDialog pd = ProgressDialog(context: Get.context);
      pd.show(
        max: 100,
        msg: 'Guardando Producto...',
        barrierColor: Colors.black54.withOpacity(0.3),
      );

      await ProductsProvider.addProduct(product);
      //
      pd.close();
      snackbar('EXITO', 'Se ha guardado el producto con éxito. ');
    } else {
      snackbar('FALLO', 'Ningún campo puede estar vacío. ');
    }
  }

  void next() async {
    ProgressDialog pd = ProgressDialog(context: Get.context);
    pd.show(
      max: 100,
      msg: 'Verificando producto...',
      barrierColor: Colors.black54.withOpacity(0.3),
    );

    ProductModel? p = await ProductsProvider.getProduct(bc.value);

    pd.close();

    if (p == null) {
      frist.value = false;
    } else {
      snackbar('FALLO', 'El producto ya está registrado. ');
      bc.value = 'Unknown';
    }
  }

  Future<void> scanBarcodeNormal() async {
    //String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      bc.value = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      //print(bc.value);
    } on PlatformException {
      //bc.value = 'Failed to get platform version.';
      bc.value = 'Unknown';
    }

    if (bc.value == '-1') bc.value = 'Unknown';

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    //if (!mounted) return;

    //scanBarcode = barcodeScanRes;
    //update();
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
