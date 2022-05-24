library home_view;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:inventario/app/features/home/controllers/home_controller.dart';
import 'package:inventario/app/features/orders_list/views/screens/order_listscreen.dart';
import 'package:inventario/app/features/products_list/views/screens/products_list_screen.dart';

part '../components/home.dart';
part '../components/navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  //final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  final List<Widget> _tabItems = [
    const Home(),
    const ProductsListScreen(),
    OrdersListScreen(),
    const Home(),
  ];

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //GlobalKey _bottomNavigationKey = GlobalKey();

    return GetBuilder<HomeController>(
      init: HomeController(),
      id: 'Home',
      builder: (_) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: Scaffold(
            //appbar transparente
            backgroundColor: Colors.white,
            extendBodyBehindAppBar: true,
            //para que el contenido no se cambie cuando el teclado sale
            resizeToAvoidBottomInset: false,
            //key: _key,
            bottomNavigationBar: Container(
              child: NavigationBar(),
              color: const Color.fromARGB(255, 226, 226, 226),
            ),
            body: _tabItems[_.page],
          ),
        );
      },
    );
  }
}
