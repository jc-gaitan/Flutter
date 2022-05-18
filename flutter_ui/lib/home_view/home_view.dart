library home_view;

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/config/routes/app_pages.dart';
import 'package:flutter_ui/favorite_view/favorite.dart';
import 'package:flutter_ui/home_view/home_controller.dart';
import 'package:flutter_ui/more_view.dart/more_view.dart';
import 'package:flutter_ui/notification_view/notification_view.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

part 'icons_home.dart';
part 'navbar_widget.dart';
part 'home.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final HomeController controller = Get.put(HomeController());

  final List<Widget> a = [
    Home(),
    const Favorite(),
    const Notifications(),
    const More(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      init: controller,
      builder: (_) {
        return Scaffold(
          body: a[controller.selectedIndex.value],
          bottomNavigationBar: const NavBar(),
        );
      },
    );
  }
}
