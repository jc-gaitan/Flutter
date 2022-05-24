import 'dart:io';
import 'dart:ui';

import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inventario/app/models/product_model.dart';
import 'package:inventario/app/providers/products_provider.dart';

class CreateProductController extends GetxController {
  var currentStep = 0.obs;
  var complete = false.obs;
  var photoLoad = false.obs;
  String scanBarcode = 'Unknown';
  String name = '';
  String quantyE = '';
  String photoUrl = '';
  String price = '';

  @override
  void onInit() async {
    super.onInit();
  }

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    //if (!mounted) return;

    scanBarcode = barcodeScanRes;
    update();
  }

  void saveProduct() async {
    ProductModel product = ProductModel(
      name: name.toUpperCase(),
      br: scanBarcode,
      price: price,
      quantityE: quantyE,
      quantitySold: '0',
      photoUrl: photoUrl,
    );
    await ProductsProvider.addProduct(product);
  }

  void onNext() {
    if (currentStep.value == 0) {
      if (scanBarcode != 'Unknown' && scanBarcode != '-1') {
        currentStep++;
      } else {
        messageError("ERROR", "ESCANEE EL CÓDIGO DE BARRAS");
      }
    } else {
      if (name.isNotEmpty &&
          quantyE.isNotEmpty &&
          photoUrl.isNotEmpty &&
          price.isNotEmpty) {
        //guardar informacions
        saveProduct();
        Get.back();
      } else {
        messageError("ERROR", "NINGÚN CAMPO PUEDE QUEDAR VACÍO");
      }
    }
  }

  void onPrevious() {
    if (currentStep.value > 0) {
      currentStep -= 1;
    } else {
      Get.back();
      //Eliminar foto cuando cancela la creacion
      deleteImg();
    }
  }

  void deleteImg() {
    if (photoUrl.isNotEmpty) {
      ProductsProvider.deleteImg(scanBarcode);
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
      //loading.value = true;
      //_.update();
      //
      photoUrl = await ProductsProvider.uploadImg(scanBarcode, foto);
      photoLoad.value = true;
      //_.update();
    }
  }

  void messageError(String title, String msg) {
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
