library products_detail_view;

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inventario/app/features/product_detail/controllers/products_detail_controller.dart';
import 'package:inventario/app/utils/constants/assets_constant.dart';

class ProductsDetailScreen extends StatelessWidget {
  const ProductsDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //GlobalKey _bottomNavigationKey = GlobalKey();

    return GetBuilder<ProductsDetailController>(
      init: ProductsDetailController(),
      id: "productDetail",
      builder: (_) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text("EDITAR PRODUCTO"),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  image(_.product.photoUrl, _),
                  const SizedBox(height: 5.0),
                  title('Nombre del producto'),
                  input(_.product.name, TextInputType.name, 1, _),
                  title('Código'),
                  input(_.product.br, TextInputType.text, 2, _),
                  title('Cantidad existente'),
                  input(_.product.quantityE, TextInputType.number, 3, _),
                  title('Precio unitario'),
                  input(_.product.price, TextInputType.number, 4, _),
                  title('Cantidad vendida: ${_.product.quantitySold}'),
                  const SizedBox(height: 5.0),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Get.theme.primaryColor,
              onPressed: () => _.updateProduct(),
              child: const Icon(Icons.save),
              tooltip: 'Guardar',
            ),
          ),
        );
      },
    );
  }

  Widget image(String url, ProductsDetailController _) {
    return InkWell(
      onTap: () => subirImagen(Get.context!, _),
      child: Container(
        width: Get.width,
        height: 300.0,
        color: Colors.white,
        child: FadeInImage(
          placeholder: const AssetImage(ImageGifConstant.gifLoading),
          image: NetworkImage(url),
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
      ),
    );
  }

  Widget input(String text, TextInputType keyboardType, int i,
      ProductsDetailController _) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        keyboardType: keyboardType,
        onChanged: (value) {
          if (value.isEmpty) {
            _.initData();
          } else {
            _.data[i] = value;
          }
        },
        decoration: InputDecoration(
          hintText: text,
          contentPadding: const EdgeInsets.only(
            top: 2.0,
            bottom: 8.0,
            left: 10.0,
            right: 10.0,
          ),
        ),
      ),
    );
  }

  Widget inputBr(String text) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: text,
          contentPadding: const EdgeInsets.only(
            top: 2.0,
            bottom: 8.0,
            left: 10.0,
            right: 10.0,
          ),
        ),
      ),
    );
  }

  Widget title(String txt) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Text(
        txt,
        style: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  void message(String text) {
    Get.rawSnackbar(
      message: text,
      snackPosition: SnackPosition.BOTTOM,
      isDismissible: true,
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
      duration: const Duration(milliseconds: 1000),
      backgroundColor: const Color.fromRGBO(46, 46, 46, 1.0),
    );
  }

  void subirImagen(BuildContext context, ProductsDetailController _) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text('Galeria'),
              onTap: () {
                _.seleccionarFoto();
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camara'),
              onTap: () {
                _.tomarFoto();
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
