import 'package:get/get.dart';
import 'package:inventario/pages/client_detail_page.dart';
import 'package:inventario/pages/create_product_page.dart';
import 'package:inventario/pages/detail_product_page.dart';
import 'package:inventario/pages/home_page.dart';
import 'package:inventario/pages/login_page.dart';

part 'app_routes.dart';

abstract class AppPages {
  static const initial = Routes.login;

  static final routes = [
    GetPage(
      name: _Paths.login,
      page: () => LoginPage(),
    ),
    GetPage(
      name: _Paths.home,
      page: () => HomePage(),
    ),
    GetPage(
      name: _Paths.createProduct,
      page: () => CreateProductPage(),
    ),
    GetPage(
      name: _Paths.detailProduct,
      page: () => DetailProductPage(),
    ),
    GetPage(
      name: _Paths.detailClient,
      page: () => DetailClientPage(),
    ),
  ];
}
