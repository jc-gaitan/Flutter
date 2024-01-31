import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventario/models/client_model.dart';

class ProductsProvider {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  static CollectionReference clientRefe =
      FirebaseFirestore.instance.collection('clients');

  static addClient(ClientModel client) {
    clientRefe
        .doc(client.cc)
        .set({
          'cc': client.cc,
          'email': client.email,
          'name': client.name,
          'orders': client.orders,
          'phone': client.phone,
        })
        .then((value) => print("product Added"))
        .catchError((error) => print("Failed to add product: $error"));
  }

  static Future<List<ClientModel>> getClients() async {
    //Obtener lista de clientes
    List<ClientModel> clients = [];
    await clientRefe.get().then((result) {
      if (result.docs.isNotEmpty) {
        for (var client in result.docs) {
          ClientModel cli = ClientModel(
            cc: client.get('cc'),
            email: client.get('email'),
            name: client.get('name'),
            //TODO: toca convertir
            orders: client.get('orders'),
            phone: client.get('phone'),
          );
          clients.add(cli);
        }
      }
    }).catchError((error) {
      //print("Failed to get product: $error");
      messageError('No se pudo realizar la consulta', '$error');
    });

    return clients;
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
