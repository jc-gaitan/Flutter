import 'package:get/get.dart';
import 'package:inventario/config/routes/app_pages.dart';
import 'package:inventario/models/product_model.dart';
import 'package:inventario/providers/products_provider.dart';

class InventoryController extends GetxController {
  void goCreateProduct() {
    Get.toNamed(Routes.createProduct)!.whenComplete(() => update());
  }

  Future<List<ProductModel>> getProducts() async {
    return await ProductsProvider.getProducts();
  }

  Future<List<ProductModel>> searchProducts(String query) async {
    return await ProductsProvider.searchProducts(query);
  }
}
