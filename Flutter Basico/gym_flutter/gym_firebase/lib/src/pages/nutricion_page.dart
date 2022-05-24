import 'package:flutter/material.dart';

import 'package:buttons_tabbar/buttons_tabbar.dart';

class NutricionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
              splashRadius: 20.0,
            ),
          )
        ],
        title: Text(
          'Nutrición',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 31),
              child: Text(
                'Para mejores resultados incorpora lo mejores nutrientes a tu cuerpo',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                  height: 1,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10.0),
            DefaultTabController(
              length: 6,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    child: ButtonsTabBar(
                      radius: 20,
                      contentPadding: EdgeInsets.symmetric(horizontal: 30),
                      unselectedBackgroundColor: Colors.transparent,
                      unselectedBorderColor: Colors.white,
                      borderWidth: 1,
                      borderColor: Colors.white,
                      center: false,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color.fromRGBO(0, 176, 155, 1),
                            Color.fromRGBO(150, 201, 61, 1),
                          ],
                        ),
                      ),
                      unselectedLabelStyle: TextStyle(color: Colors.white),
                      labelStyle: TextStyle(color: Colors.white),
                      //height: 20,
                      tabs: [
                        Tab(text: "Todas"),
                        Tab(text: "Ensaladas"),
                        Tab(text: "Batidos"),
                        Tab(text: "Proteinas"),
                        Tab(text: "Vitaminas"),
                        Tab(text: "Compras"),
                      ],
                    ),
                  ),
                  Container(
                    height: 100.0,
                    //width: double.infinity,
                    child: TabBarView(
                      children: [
                        Center(
                          child: Icon(Icons.directions_car),
                        ),
                        Center(
                          child: Icon(Icons.directions_transit),
                        ),
                        Center(
                          child: Icon(Icons.directions_bike),
                        ),
                        Center(
                          child: Icon(Icons.directions_car),
                        ),
                        Center(
                          child: Icon(Icons.directions_transit),
                        ),
                        Center(
                          child: Icon(Icons.directions_bike),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
