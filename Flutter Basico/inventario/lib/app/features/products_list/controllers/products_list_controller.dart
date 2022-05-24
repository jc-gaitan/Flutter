import 'package:get/get.dart';
import 'package:inventario/app/models/product_model.dart';
import 'package:inventario/app/providers/products_provider.dart';

class ProductsListController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
  }

  Future<List<ProductModel>> getProducts() async {
    return await ProductsProvider.getProducts();
  }

  Future<List<ProductModel>> searchProducts(String query) async {
    return await ProductsProvider.searchProducts(query);
  }
}
