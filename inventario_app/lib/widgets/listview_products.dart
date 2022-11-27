import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventario/config/routes/app_pages.dart';
import 'package:inventario/models/product_model.dart';
import 'package:inventario/utils/constants/assets_constant.dart';

import '../controllers/inventory_controller.dart';

class ListViewProducts extends StatelessWidget {
  ListViewProducts({required this.products, Key? key}) : super(key: key);

  final List<ProductModel> products;

  final InventoryController controller = Get.put(InventoryController());

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      itemCount: products.length,
      itemBuilder: (context, index) => card(products[index]),
    );
  }

  Widget card(ProductModel product) {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.only(top: 8.0, left: 5.0, right: 5.0),
      child: InkWell(
        onTap: () => Get.toNamed(
          Routes.detailProduct,
          arguments: product,
        )!
            .whenComplete(() => controller.update()),
        child: Container(
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
          child: Stack(
            children: [
              //imagen
              img(product.photoUrl),
              //informacion
              Container(
                width: Get.width * 0.7556,
                height: 102.0,
                padding: const EdgeInsets.only(left: 125.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0, bottom: 2.0),
                        child: Text(
                          product.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      info("Código: ${product.br}"),
                      info("Cantidad existente: ${product.quantityE}"),
                      info("Cantidad vendida: ${product.quantitySold}"),
                      const SizedBox(height: 3.0),
                    ],
                  ),
                ),
              ),
              //precio
              priceWidget(product.price, product.quantityE),
            ],
          ),
        ),
      ),
    );
  }

  String moneyFormat(String price) {
    var value = price;
    if (price.length > 2) {
      value = value.replaceAll(RegExp(r'\D'), '');
      value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), '.');
    }
    return value;
  }

  Widget priceWidget(String price, String quantityE) {
    if (quantityE == '0') {
      return Positioned(
        right: 0.0,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Get.theme.errorColor,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
          ),
          child: const Text(
            "AGOTADO",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    } else {
      return Positioned(
        right: 0.0,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Get.theme.primaryColor,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
          ),
          child: Text(
            "\$${moneyFormat(price)}",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }
  }

  Widget img(String photoUrl) {
    return Container(
      width: Get.width * 0.3333,
      height: 102.0,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10.0),
          topLeft: Radius.circular(10.0),
        ),
      ),
      child: FadeInImage(
        placeholder: const AssetImage(ImageGifConstant.gifLoading),
        image: NetworkImage(photoUrl),
        fadeOutDuration: const Duration(milliseconds: 200),
        //height: 300,
        fit: BoxFit.fitHeight,
        imageErrorBuilder: (context, exception, stackTrace) {
          //print('Error Handler');
          return Image.asset(
            ImagePngConstant.noImage,
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }

  Widget info(String txt) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Text(
        txt,
        style: const TextStyle(
          fontSize: 12.0,
        ),
        textAlign: TextAlign.start,
      ),
    );
  }
}
