import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:inventario/controllers/home_controller.dart';
import 'package:inventario/pages/charts_page.dart';
import 'package:inventario/pages/clients_page.dart';
import 'package:inventario/pages/inventory_page.dart';

import 'orders_page.dart';

class HomePage extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  HomePage({Key? key}) : super(key: key);

  final List<Widget> pages = [
    ChartsPage(),
    InventoryPage(),
    OrdersPage(),
    ClientsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      init: controller,
      builder: (_) {
        return Scaffold(
          body: pages[controller.selectedIndex.value],
          bottomNavigationBar: navBarWidget(),
        );
      },
    );
  }

  Widget navBarWidget() {
    const padding = EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0);
    const double gap = 10.0;

    return Container(
      margin: const EdgeInsets.only(
        top: 1.0,
        bottom: 5.0,
        left: 10.0,
        right: 10.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        boxShadow: [
          BoxShadow(
            spreadRadius: -10,
            blurRadius: 60,
            color: Colors.black.withOpacity(.4),
            offset: const Offset(0, 25),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 3),
        child: GNav(
          tabs: [
            GButton(
              gap: gap,
              iconActiveColor: Colors.purple,
              iconColor: Colors.black,
              textColor: Colors.purple,
              backgroundColor: Colors.purple.withOpacity(.2),
              iconSize: 24,
              padding: padding,
              icon: Icons.query_stats,
              text: 'Graficos',
            ),
            GButton(
              gap: gap,
              iconActiveColor: Colors.pink,
              iconColor: Colors.black,
              textColor: Colors.pink,
              backgroundColor: Colors.pink.withOpacity(.2),
              iconSize: 24,
              padding: padding,
              icon: Icons.inventory_2,
              text: "Inventario",
            ),
            GButton(
              gap: gap,
              iconActiveColor: Colors.amber[600],
              iconColor: Colors.black,
              textColor: Colors.amber[600],
              backgroundColor: Colors.amber[600]!.withOpacity(.2),
              iconSize: 24,
              padding: padding,
              icon: Icons.shopping_cart,
              text: 'Pedidos',
            ),
            GButton(
              gap: gap,
              iconActiveColor: Colors.teal,
              iconColor: Colors.black,
              textColor: Colors.teal,
              backgroundColor: Colors.teal.withOpacity(.2),
              iconSize: 24,
              padding: padding,
              icon: Icons.person,
              text: 'Clientes',
            )
          ],
          selectedIndex: controller.selectedIndex.value,
          onTabChange: (index) {
            controller.selectedIndex.value = index;
            //controller.jumpToPage(index);
          },
        ),
      ),
    );
  }
}
