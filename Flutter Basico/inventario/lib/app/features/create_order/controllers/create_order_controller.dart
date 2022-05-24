import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:inventario/app/models/order_model.dart';
import 'package:inventario/app/models/product_model.dart';
import 'package:inventario/app/providers/order_provider.dart';
import 'package:inventario/app/providers/products_provider.dart';

class CreateOrderController extends GetxController {
  bool isLoading = false;
  String scanBarcode = 'Unknown';
  double total = 0;
  int discount = 0;
  List<ProductModel> items = [];
  List<Map> products = [];
  List<int> quantity = [];
  late String date = "";
  late DateTime x;
  final List nameMonth = [
    "Enero",
    "Febrero",
    "Marzo",
    "Abril",
    "Mayo",
    "Junio",
    "Julio",
    "Agosto",
    "Septiembre",
    "Octubre",
    "Noviembre",
    "Diciembre",
  ];

  @override
  void onInit() async {
    x = DateTime.now();
    date = "${x.day} de ${getNameMonth(x.month)}"; // del ${x.year}
    super.onInit();
  }

  String getNameMonth(int month) {
    return nameMonth[month - 1];
  }

  void descuento(String value) {
    if (value.isEmpty) {
      discount = 0;
    } else {
      discount = int.parse(value);
    }

    total = getTotal();
    update();
  }

  double getTotal() {
    double total = 0;
    for (int i = 0; i < items.length; i++) {
      total += double.parse(items[i].price) * quantity[i];
    }

    var aux = total * discount / 100;
    total = total - aux;

    return total;
  }

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    scanBarcode = barcodeScanRes;
    searchProduct();
    update();
  }

  searchProduct() async {
    //Mostrar el alert dialog loading
    showLoaderDialog(Get.context!);
    //
    ProductModel? product = await ProductsProvider.getProduct(scanBarcode);
    if (product != null) {
      //añadir
      items.add(product);
      quantity.add(1);
      products.add({
        'br': product.br,
        'name': product.name,
        'price': product.price,
      });
      total = getTotal();
      update();
      //cerrar el alert dialog loading
      Get.back();
      //print("EXISTE");
    } else {
      messageError('ERROR', 'EL PRODUCTO NO EXISTE.');
    }
  }

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(
            margin: const EdgeInsets.only(left: 7),
            child: const Text("Cargando..."),
          ),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void reduceQuantity(int i, ProductModel product) {
    if (quantity[i] > 1) {
      quantity[i]--;
    } else {
      items.remove(product);
      quantity.removeAt(i);
    }
    total = getTotal();
    update();
  }

  void increaseQuantity(int i) {
    quantity[i]++;
    total = getTotal();
    update();
  }

  void saveOrder() async {
    if (items.isEmpty) {
      //print("NO HAY PRODUCTOS");
      return;
    }
    //
    isLoading = true;
    update();
    //
    OrderModel order = OrderModel(
      products: products,
      quantities: quantity,
      discount: discount,
      total: "${total.round()}",
      fecha: x,
      id: "",
    );
    OrderProvider.addOrder(order);

    isLoading = false;
    update();

    //
    Get.back();

    //
    Get.rawSnackbar(
      message: "SE HA GUARDADO EL PEDIDO.",
      duration: const Duration(milliseconds: 900),
      isDismissible: true,
    );
  }

  void messageError(String title, String msg) {
    Get.snackbar(
      title,
      msg,
      colorText: const Color.fromRGBO(255, 255, 255, 1.0),
      snackPosition: SnackPosition.BOTTOM,
      isDismissible: true,
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
      duration: const Duration(milliseconds: 1000),
      backgroundColor: const Color.fromRGBO(46, 46, 46, 1.0),
    );
  }

  String moneyFormat(String price) {
    //int val = total.toInt();
    var value = price;
    if (price.length > 2) {
      value = value.replaceAll(RegExp(r'\D'), '');
      value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), '.');
    }
    return value;
  }
}
