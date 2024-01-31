import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventario/controllers/inventory_controller.dart';
import 'package:inventario/models/product_model.dart';
import 'package:inventario/pages/search_inventory.dart';
import 'package:inventario/widgets/listview_products.dart';

class InventoryPage extends StatelessWidget {
  InventoryPage({Key? key}) : super(key: key);

  final InventoryController controller = Get.put(InventoryController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InventoryController>(
      init: controller,
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              searchButton(),
            ],
            title: const Text("Inventario"),
          ),
          body: body(),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Get.theme.primaryColor,
            onPressed: controller.goCreateProduct,
            tooltip: 'Añadir un nuevo producto',
            child: const Icon(Icons.add_outlined),
          ),
        );
      },
    );
  }

  Padding searchButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: IconButton(
        onPressed: () => showSearch(
          context: Get.context!,
          delegate: SearchInventory(controller),
        ),
        icon: const Icon(Icons.search),
        splashRadius: 20.0,
      ),
    );
  }

  Widget body() {
    return FutureBuilder(
      future: controller.getProducts(),
      builder:
          (BuildContext context, AsyncSnapshot<List<ProductModel>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isNotEmpty) {
            return ListViewProducts(products: snapshot.data!);
          } else {
            return const Center(
              child: Text("NO HAY PRODUCTOS REGISTRADOS"),
            );
          }
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: Get.theme.primaryColor,
            ),
          );
        }
      },
    );
  }
}
