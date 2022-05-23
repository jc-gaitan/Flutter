import 'package:flutter_ui/business_view/business_view.dart';
import 'package:flutter_ui/home_view/home_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

abstract class AppPages {
  static const initial = Routes.home;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => HomeView(),
    ),
    GetPage(
      name: _Paths.business,
      page: () => BusinessView(),
    ),
  ];
}
