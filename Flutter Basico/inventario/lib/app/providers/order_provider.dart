import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventario/app/models/order_model.dart';
import 'package:inventario/app/models/product_model.dart';

class OrderProvider {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  static CollectionReference orderRefe =
      FirebaseFirestore.instance.collection('orders');

  static addOrder(OrderModel order) {
    String id = orderRefe.doc().id;
    orderRefe
        .doc(id)
        .set({
          'id': id,
          'fecha': order.fecha,
          'products': List<dynamic>.from(order.products.map((x) => x)),
          'quantities': List<dynamic>.from(order.quantities.map((x) => x)),
          'total': order.total,
          'discount': order.discount,
        })
        .then((value) => print("order Added"))
        .catchError((error) => print("Failed to add order: $error"));
  }

  static Future<List<OrderModel>> getOrders(DateTime x) async {
    //Obtener lista de productos
    List<OrderModel> orders = [];
    await orderRefe
        .where('fecha', isGreaterThanOrEqualTo: x)
        .get()
        .then((result) {
      if (result.docs.isNotEmpty) {
        for (var order in result.docs) {
          Timestamp now = order.get('fecha');
          OrderModel ord = OrderModel(
            discount: order.get('discount'),
            id: order.get('id'),
            fecha: now.toDate(),
            products: List<Map>.from(order.get('products')),
            quantities: List<int>.from(order.get('quantities')),
            total: order.get('total'),
          );
          orders.add(ord);
        }
      }
    }).catchError((error) {
      //print("Failed to get product: $error");
      messageError('No se pudo realizar la consulta', '$error');
    });

    return orders;
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
