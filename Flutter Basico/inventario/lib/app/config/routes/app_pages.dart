import 'package:get/get.dart';
import 'package:inventario/app/features/create_order/views/screens/create_order_screen.dart';
import 'package:inventario/app/features/home/views/screens/home_screen.dart';
import 'package:inventario/app/features/login/views/screens/login_screen.dart';
import 'package:inventario/app/features/order_detail/views/screens/order_detail_screen.dart';
import 'package:inventario/app/features/orders_list/views/screens/order_listscreen.dart';
import 'package:inventario/app/features/product_detail/views/screens/products_detail_screen.dart';
import 'package:inventario/app/features/products_list/views/screens/products_list_screen.dart';

import '../../features/create_product/views/screens/create_product_screen.dart';
part 'app_routes.dart';

abstract class AppPages {
  static const initial = Routes.login;

  static final routes = [
    GetPage(
      name: _Paths.login,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: _Paths.home,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: _Paths.ordersList,
      page: () => OrdersListScreen(),
    ),
    GetPage(
      name: _Paths.productsList,
      page: () => const ProductsListScreen(),
    ),
    GetPage(
      name: _Paths.orderDetail,
      page: () => const OrderDetailScreen(),
    ),
    GetPage(
      name: _Paths.productsDetail,
      page: () => const ProductsDetailScreen(),
    ),
    GetPage(
      name: _Paths.createProduct,
      page: () => const CreateProductScreen(),
    ),
    GetPage(
      name: _Paths.createOrder,
      page: () => const CreateOrderScreen(),
    ),
  ];
}
