library orders_view;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventario/app/config/routes/app_pages.dart';
import 'package:intl/intl.dart';

import 'package:inventario/app/features/orders_list/controllers/order_list_controller.dart';
import 'package:inventario/app/models/order_model.dart';

class OrdersListScreen extends StatelessWidget {
  OrdersListScreen({Key? key}) : super(key: key);

  final controller = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    //GlobalKey _bottomNavigationKey = GlobalKey();

    return GetBuilder<OrderController>(
      init: OrderController(),
      id: 'Home',
      builder: (_) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 226, 226, 226),
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: () => Get.toNamed(Routes.createOrder),
                  icon: const Icon(Icons.add_shopping_cart_outlined),
                  tooltip: 'Crear pedido',
                  splashRadius: 20.0,
                ),
              ],
              title: const Text("PEDIDOS"),
            ),
            body: FutureBuilder(
              future: _.getOrders(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<OrderModel>> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.isNotEmpty) {
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: orders(snapshot.data!),
                      ),
                    );
                  } else {
                    return const Center(
                      child: Text("No hay ordenes para este mes"),
                    );
                  }
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            /*floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add_shopping_cart_outlined),
              tooltip: 'Crear pedido',
            ),*/
          ),
        );
      },
    );
  }

  List<Widget> orders(List<OrderModel> data) {
    List<Widget> wids = [];

    for (var element in data) {
      wids.add(orderDetail(element));
    }

    return wids;
  }

  Widget card(String id, String valor, String fecha) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.orderDetail),
      child: Container(
        padding: const EdgeInsets.only(top: 10.0),
        margin: const EdgeInsets.all(5.0),
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(51, 47, 44, 0.6),
              blurRadius: 2.0,
              spreadRadius: 0.0,
              offset: Offset(2.0, 2.0), // shadow direction: bottom right
            )
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Id: $id'),
              Text("Valor: $valor"),
              Text('Fecha: $fecha'),
            ],
          ),
        ),
      ),
    );
  }

  Widget orderDetail(OrderModel order) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      width: Get.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(51, 47, 44, 0.6),
            blurRadius: 2.0,
            spreadRadius: 0.0,
            offset: Offset(2.0, 2.0), // shadow direction: bottom right
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          info('ID: ${order.id}'),
          info('FECHA: ${fecha(order.fecha)}'),
          const SizedBox(height: 5.0),
          Container(
            decoration: const BoxDecoration(
              border:
                  Border.symmetric(horizontal: BorderSide(color: Colors.grey)),
              color: Colors.white,
            ),
            child: ExpansionTile(
              title: const Text(
                "PRODUCTOS",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              childrenPadding: const EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: 0.0,
              ),
              tilePadding: const EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: 10.0,
              ),
              children: [
                prod(order.products, order.quantities),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "DESCUENTO: ${order.discount}%",
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
            child: Text(
              "TOTAL: \$${moneyFormat(order.total)}",
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String fecha(DateTime date) {
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    final String formatted = formatter.format(date);
    return formatted;
  }

  Widget prod(List<Map> prod, List<int> quantity) {
    return SizedBox(
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DataTable(
            columns: const [
              DataColumn(
                label: Text(
                  'Nombre',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  'Cantidad',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  'Precio',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ],
            rows: rows(prod, quantity),
          ),
        ],
      ),
    );
  }

  List<DataRow> rows(List<Map> prod, List<int> quantity) {
    List<DataRow> rs = [];

    for (var i = 0; i < prod.length; i++) {
      rs.add(
        DataRow(
          cells: [
            DataCell(Text(prod[i]['name'])),
            DataCell(Text('${quantity[i]}')),
            DataCell(Text(moneyFormat(prod[i]['price']))),
          ],
        ),
      );
    }

    return rs;
  }

  String moneyFormat(String price) {
    var value = price;
    if (price.length > 2) {
      value = value.replaceAll(RegExp(r'\D'), '');
      value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), '.');
    }
    return value;
  }

  Widget info(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
