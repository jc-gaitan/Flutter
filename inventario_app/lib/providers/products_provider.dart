import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:inventario/models/product_model.dart';
//import 'package:sn_progress_dialog/sn_progress_dialog.dart';

class ProductsProvider {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  static CollectionReference productsRefe =
      FirebaseFirestore.instance.collection('products');

  static addProduct(ProductModel product) {
    productsRefe
        .doc(product.br)
        .set({
          'name': product.name,
          'br': product.br,
          'photoUrl': product.photoUrl,
          'price': product.price,
          'quantityE': product.quantityE,
          'quantitySold': product.quantitySold,
        })
        .then((value) => print("product Added"))
        .catchError((error) => print("Failed to add product: $error"));
  }

  static Future<List<ProductModel>> getProducts() async {
    //Obtener lista de productos
    List<ProductModel> products = [];
    await productsRefe.get().then((result) {
      if (result.docs.isNotEmpty) {
        for (var product in result.docs) {
          ProductModel prod = ProductModel(
            name: product.get('name'),
            br: product.get('br'),
            photoUrl: product.get('photoUrl'),
            price: product.get('price'),
            quantityE: product.get('quantityE'),
            quantitySold: product.get('quantitySold'),
          );
          products.add(prod);
        }
      }
    }).catchError((error) {
      //print("Failed to get product: $error");
      messageError('No se pudo realizar la consulta', '$error');
    });

    return products;
  }

  static Future<ProductModel?> getProduct(String br) async {
    ProductModel? prod;
    //Obtener lista de productos
    await productsRefe.where('br', isEqualTo: br).get().then((result) {
      if (result.docs.isNotEmpty) {
        for (var product in result.docs) {
          prod = ProductModel(
            name: product.get('name'),
            br: product.get('br'),
            photoUrl: product.get('photoUrl'),
            price: product.get('price'),
            quantityE: product.get('quantityE'),
            quantitySold: product.get('quantitySold'),
          );
        }
      }
    }).catchError((error) {
      //print("Failed to get product: $error");
      messageError('No se pudo realizar la consulta', '$error');
    });

    return prod;
  }

  static Future<List<ProductModel>> searchProducts(String query) async {
    //Obtener lista de productos
    List<ProductModel> products = [];
    await productsRefe
        .where('name', isGreaterThanOrEqualTo: query)
        .where('name', isLessThan: query + 'z')
        .get()
        .then((result) {
      if (result.docs.isNotEmpty) {
        for (var product in result.docs) {
          ProductModel prod = ProductModel(
            name: product.get('name'),
            br: product.get('br'),
            photoUrl: product.get('photoUrl'),
            price: product.get('price'),
            quantityE: product.get('quantityE'),
            quantitySold: product.get('quantitySold'),
          );
          products.add(prod);
        }
      }
    }).catchError((error) {
      //print("Failed to get product: $error");
      messageError('No se pudo realizar la consulta', '$error');
    });

    return products;
  }

  static Future<String> uploadImg(String name, File img) async {
    String photoUrl = '';

    var storageimage =
        FirebaseStorage.instance.ref().child('image_product/$name');
    var task1 = storageimage.putFile(img);
    photoUrl = await (await task1).ref.getDownloadURL();

    return photoUrl;
  }

  static updateImg(String bc, String url) {
    productsRefe.doc(bc).update({"photoUrl": url});
  }

  static deleteImg(String name) {
    FirebaseStorage.instance.ref().child('image_product/$name').delete();
  }

  static void messageError(String text, String err) {
    Get.snackbar(
      text,
      'ERROR = $err',
      colorText: const Color.fromRGBO(255, 255, 255, 1.0),
      snackPosition: SnackPosition.BOTTOM,
      isDismissible: true,
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
      duration: const Duration(milliseconds: 1000),
      backgroundColor: const Color.fromRGBO(46, 46, 46, 1.0),
    );
  }
}
