part of 'app_pages.dart';

abstract class Routes {
  static const login = _Paths.login;
  static const home = _Paths.home;
  static const createProduct = _Paths.createProduct;
  static const detailProduct = _Paths.detailProduct;
  static const detailClient = _Paths.detailClient;
}

abstract class _Paths {
  static const login = '/login/';
  static const home = '/home/';
  static const createProduct = '/createProduct/';
  static const detailProduct = '/detailProduct/';
  static const detailClient = '/detailClient/';
}
