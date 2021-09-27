library home_view;

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:powergym/app/models/user_model.dart';
import 'package:powergym/app/modules/home/controllers/home_controller.dart';

part '../components/activity.dart';
part '../components/progress.dart';
part '../components/nutrition.dart';
part '../components/news.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    GlobalKey _bottomNavigationKey = GlobalKey();

    return GetBuilder<HomeController>(
      init: HomeController(),
      id: 'appbar',
      builder: (_) {
        return Scaffold(
          //appbar transparente
          backgroundColor: Color.fromRGBO(72, 83, 101, 1),
          extendBodyBehindAppBar: true,
          //para que el contenido no se cambie cuando el teclado sale
          resizeToAvoidBottomInset: false,
          key: _key,
          appBar: AppBar(
            actions: [
              iconAction(_.page, _),
            ],
            title: Text(_.titulo),
            centerTitle: true,
          ),
          bottomNavigationBar: CurvedNavigationBar(
            key: _bottomNavigationKey,
            index: 1,
            height: 50.0,
            items: <Widget>[
              Icon(Icons.house, size: 30),
              Icon(Icons.grid_view_outlined, size: 30),
              Icon(Icons.account_circle_outlined, size: 30),
              Icon(Icons.restaurant_menu_outlined, size: 30),
              Icon(Icons.credit_score_outlined, size: 30),
            ],
            color: Colors.white,
            buttonBackgroundColor: Colors.white,
            backgroundColor: Color.fromRGBO(72, 83, 101, 1),
            animationCurve: Curves.easeInOut,
            animationDuration: Duration(milliseconds: 400),
            onTap: (index) {
              _.updateAppbar(index);
            },
          ),
          body: containerInfo(_.page),
        );
      },
    );
  }

  Widget iconAction(int page, HomeController _) {
    switch (page) {
      case 1:
        return Container(
          margin: EdgeInsets.only(right: 10.0),
          child: IconButton(
            onPressed: () => _.logout(),
            icon: Icon(Icons.logout),
            splashRadius: 20.0,
          ),
        );
      case 3:
        return Container(
          margin: EdgeInsets.only(right: 10.0),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            splashRadius: 20.0,
          ),
        );
      default:
        return Container();
    }
  }

  Widget containerInfo(int page) {
    switch (page) {
      case 0:
        return News();
      case 1:
        return MyActivity();
      case 2:
        return MyProgress();
      case 3:
        return Nutrition();
      case 4:
        return News();
      default:
        return Container(
          color: Color.fromRGBO(72, 83, 101, 1),
        );
    }
  }
}
