library create_products_view;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:inventario/app/features/create_product/controllers/create_product_controller.dart';
import 'package:inventario/app/utils/constants/assets_constant.dart';

part '../components/stepper_create_product.dart';

class CreateProductScreen extends StatelessWidget {
  const CreateProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateProductController>(
      init: CreateProductController(),
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text("CREAR PRODUCTO"),
          ),
          body: SingleChildScrollView(child: StepperCreateProduct()),
        );
      },
    );
  }
}
