import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventario/config/routes/app_pages.dart';
import 'package:inventario/controllers/clients_controller.dart';
import 'package:inventario/models/client_model.dart';

class ClientsPage extends StatelessWidget {
  ClientsPage({Key? key}) : super(key: key);

  final ClientsController controller = Get.put(ClientsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Clientes"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: body(),
      ),
    );
  }

  ListView body() {
    return ListView.builder(
      itemCount: controller.a.length,
      itemBuilder: (context, index) => data(ClientModel(
          cc: '1', name: 'asd', orders: [], phone: '310', email: 'asd')),
    );
  }

  Widget column() {
    const TextStyle title = TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
    );
    const TextStyle style = TextStyle(
      fontSize: 16.0,
    );
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            txt('CC:', title),
            txt('Nombre:', title),
            txt('Telefono:', title),
            txt('Email:', title),
            txt('Pedidos', title),
          ],
        ),
        const SizedBox(width: 10.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            txt('1117551707', style),
            txt('Juan Gaitan', style),
            txt('3104407606', style),
            txt('asd@asd.com', style),
            txt('', style),
          ],
        ),
      ],
    );
  }

  Widget txt(String text, TextStyle title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.5),
      child: Text(
        text,
        style: title,
      ),
    );
  }

  Widget data(ClientModel client) {
    return InkWell(
      onTap: () => Get.toNamed(
        Routes.detailClient,
        arguments: client,
      )!
          .whenComplete(() => controller.update()),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: column(),
        ),
      ),
    );
  }
}
