part of 'app_pages.dart';

abstract class Routes {
  static const splash = _Paths.splash;
  static const login = _Paths.login;
  static const home = _Paths.home;
  static const ordersList = _Paths.ordersList;
  static const productsList = _Paths.productsList;
  static const orderDetail = _Paths.orderDetail;
  static const productsDetail = _Paths.productsDetail;
  static const createProduct = _Paths.createProduct;
  static const createOrder = _Paths.createOrder;
}

abstract class _Paths {
  static const splash = '/splash/';
  static const login = '/login/';
  static const home = '/home/';
  static const ordersList = '/ordersList/';
  static const productsList = '/productsList/';
  static const orderDetail = '/orderDetail/';
  static const productsDetail = '/productsDetail/';
  static const createProduct = '/createProduct/';
  static const createOrder = '/createOrder/';
}
