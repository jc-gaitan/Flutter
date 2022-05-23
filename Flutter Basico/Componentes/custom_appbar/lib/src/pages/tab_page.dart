import 'package:custom_appbar/src/pages/progreso_page.dart';
import 'package:custom_appbar/src/pages/prueba.dart';
import 'package:custom_appbar/src/pages/pruebaDos.dart';
import 'package:flutter/material.dart';
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
    return Scaffold(
      //appbar transparente
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      //para que el contenido no se cambie cuando el teclado sale
      resizeToAvoidBottomInset: false,
      /* appBar: AppBar(
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.ac_unit),
              splashRadius: 20.0,
            ),
          )
        ],
        title: Text(
          'Mi Actividad',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),*/
      body: Stack(
        children: [
          _fondo(),
          //SingleChildScrollView(),
          new TabBarView(
            children: <Widget>[
              new NoticiasPage(),
              new HomePage(),
              new PruebaPage(),
              new ProgresoPage(),
              PruebaDos(),
            ],
            controller: this.tabController,
          ),
        ],
      ),
      bottomNavigationBar: new Material(
        //cambiar le color de tabBar
        color: Color.fromRGBO(36, 59, 85, 1.0),
        //cambiar icono tabBar
        child: new TabBar(
          //color del indicador donde esta
          indicatorColor: Colors.white,
          //color de los no seleccionados
          unselectedLabelColor: Colors.grey,
          //color de seleccion
          labelColor: Colors.white,
          tabs: [
            new Tab(
              icon: new Icon(
                Icons.house,
                size: 30,
              ),
            ),
            new Tab(
              icon: new Icon(
                Icons.list,
                size: 30,
              ),
            ),
            new Tab(
              icon: new Icon(
                Icons.departure_board_outlined,
                size: 30,
              ),
            ),
            new Tab(
              icon: new Icon(
                Icons.person,
                size: 30,
              ),
            ),
            new Tab(
              icon: new Icon(
                Icons.house,
                size: 30,
              ),
            ),
          ],
          controller: this.tabController,
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
