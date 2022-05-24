import 'package:get/get.dart';
import 'package:inventario/app/models/order_model.dart';
import 'package:inventario/app/models/product_model.dart';
import 'package:inventario/app/providers/order_provider.dart';
import 'package:inventario/app/providers/products_provider.dart';

class OrderController extends GetxController {
  int page = 0;
  String choice = "";

  @override
  void onInit() async {
    super.onInit();
  }

  Future<List<OrderModel>> getOrders() async {
    DateTime now = DateTime.now();
    DateTime x = DateTime(now.year, now.month - 1, now.day);
    List<OrderModel> a = await OrderProvider.getOrders(x);

    return a;
  }

  Future<List<ProductModel?>> getProducts(List<String> br) async {
    List<ProductModel?> prod = [];
    for (var element in br) {
      prod.add(await ProductsProvider.getProduct(element));
    }

    print(prod);

    return prod;
  }
}
