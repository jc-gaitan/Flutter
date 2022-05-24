library orders_view;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:inventario/app/features/order_detail/controllers/order_detail_controller.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //GlobalKey _bottomNavigationKey = GlobalKey();

    return GetBuilder<OrderDetailController>(
      init: OrderDetailController(),
      id: 'orderDetail',
      builder: (_) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text("Detalle del pedido"),
            ),
            body: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(5.0),
                width: Get.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: Colors.red,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(51, 47, 44, 0.6),
                      blurRadius: 2.0,
                      spreadRadius: 0.0,
                      offset:
                          Offset(2.0, 2.0), // shadow direction: bottom right
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    info('ID: 123456'),
                    info('FECHA: 23/03/2022'),
                    const SizedBox(height: 5.0),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        color: Colors.white,
                      ),
                      child: ExpansionTile(
                        title: const Text("PRODUCTOS"),
                        childrenPadding: const EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 0.0,
                        ),
                        tilePadding: const EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 10.0,
                        ),
                        children: [
                          SizedBox(
                            width: Get.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DataTable(
                                  columns: const [
                                    DataColumn(
                                      label: Text(
                                        'Nombre',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Cantidad',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Precio',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                  rows: const [
                                    DataRow(cells: [
                                      DataCell(Text(
                                          'Ron viejo de caldas de 1500 años')),
                                      DataCell(Text('123456')),
                                      DataCell(Text('58000')),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text(
                                          'Ron viejo de caldas de 1500 años')),
                                      DataCell(Text('123456')),
                                      DataCell(Text('58000')),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text(
                                          'Ron viejo de caldas de 1500 años')),
                                      DataCell(Text('123456')),
                                      DataCell(Text('58000')),
                                    ]),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "TOTAL: 58000",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget info(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0),
      child: Text(
        text,
        style: const TextStyle(color: Colors.black, fontSize: 16.0),
      ),
    );
  }
}
