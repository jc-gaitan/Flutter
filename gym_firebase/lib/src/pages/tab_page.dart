import 'package:flutter/material.dart';
import 'package:gym_firebase/src/pages/nutricion_page.dart';
import 'package:gym_firebase/src/pages/progreso_page.dart';
import 'package:gym_firebase/src/pages/pruebas.dart';
import 'home_page.dart';
import 'noticias_page.dart';

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void dispose() {
    super.dispose();
    //toca eliminar el scrollController cuando se cierrar la ventana, para prevenir fugas de memoria.
    tabController.dispose();
  }

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 5, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);

    return MediaQuery(
      data: data.copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        //appbar transparente
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        //para que el contenido no se cambie cuando el teclado sale
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            _fondo(),
            //SingleChildScrollView(),
            TabBarView(
              children: <Widget>[
                NoticiasPage(),
                HomePage(),
                ProgresoPage(),
                NutricionPage(),
                PruebaPage(),
              ],
              controller: this.tabController,
            ),
          ],
        ),
        bottomNavigationBar: Material(
          //cambiar le color de tabBar
          color: Color.fromRGBO(36, 59, 85, 1.0),
          //cambiar icono tabBar
          child: TabBar(
            //color del indicador donde esta
            indicatorColor: Colors.white,
            //color de los no seleccionados
            unselectedLabelColor: Colors.grey,
            //color de seleccion
            labelColor: Colors.white,
            tabs: [
              Tab(
                icon: Icon(
                  Icons.house,
                  size: 30,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.grid_view_outlined,
                  //widgets_outlined
                  size: 30,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.account_circle_outlined,
                  size: 30,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.restaurant_menu_outlined,
                  size: 30,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.credit_score_outlined,
                  //card_membership_outlined
                  size: 30,
                ),
              ),
            ],
            controller: this.tabController,
          ),
        ),
      ),
    );
  }

  Widget _fondo() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Color.fromRGBO(72, 83, 101, 1.0),
      ),
    );
  }
}
