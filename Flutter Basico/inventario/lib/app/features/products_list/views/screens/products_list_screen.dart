library products_list_view;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventario/app/config/routes/app_pages.dart';
import 'package:inventario/app/features/products_list/controllers/products_list_controller.dart';
import 'package:inventario/app/models/product_model.dart';
import 'package:inventario/app/utils/constants/assets_constant.dart';

part '../components/product_list_widget.dart';
part '../components/search_delegate.dart';
part '../components/card_product.dart';

class ProductsListScreen extends StatelessWidget {
  const ProductsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //GlobalKey _bottomNavigationKey = GlobalKey();

    return GetBuilder<ProductsListController>(
      init: ProductsListController(),
      builder: (_) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 226, 226, 226),
            appBar: AppBar(
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: IconButton(
                    onPressed: () => showSearch(
                      context: context,
                      delegate: DataSearch(_),
                    ),
                    icon: const Icon(Icons.search),
                    splashRadius: 20.0,
                  ),
                ),
              ],
              title: const Text("INVENTARIO"),
            ),
            body: const SingleChildScrollView(child: ProductListWidget()),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Get.theme.primaryColor,
              onPressed: () => Get.toNamed(Routes.createProduct)!
                  .whenComplete(() => _.update(["listProduct"])),
              child: const Icon(Icons.add_outlined),
              tooltip: 'Añadir un nuevo producto',
            ),
          ),
        );
      },
    );
  }
}
