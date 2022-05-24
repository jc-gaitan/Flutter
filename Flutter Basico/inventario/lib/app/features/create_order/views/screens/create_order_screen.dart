library create_order_view;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventario/app/features/create_order/controllers/create_order_controller.dart';
import 'package:inventario/app/models/product_model.dart';
import 'package:inventario/app/utils/constants/assets_constant.dart';

part '../components/section_widget.dart';

class CreateOrderScreen extends StatelessWidget {
  const CreateOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateOrderController>(
      init: CreateOrderController(),
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text("CREAR PEDIDO"),
          ),
          body: const SectionWidget(),
          bottomNavigationBar: nav(_),
        );
      },
    );
  }

  Widget nav(CreateOrderController _) {
    TextStyle style = const TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    );
    TextStyle style1 = const TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.normal,
    );
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
      height: 100.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'TOTAL: ',
                style: style,
              ),
              Text(
                '\$${_.moneyFormat('${_.total.toInt()}')}',
                style: style1,
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          ElevatedButton(
            onPressed: (_.isLoading) ? null : () => _.saveOrder(),
            child: (_.isLoading)
                ? const CircularProgressIndicator()
                : const Text("GUARDAR"),
          ),
          const SizedBox(height: 2.0),
        ],
      ),
    );
  }
}
