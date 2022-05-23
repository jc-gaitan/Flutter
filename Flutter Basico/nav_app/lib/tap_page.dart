import 'package:flutter/material.dart';

import 'home.dart';

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
    tabController = new TabController(length: 4, vsync: this, initialIndex: 1);
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
                Home(),
                Home(),
                Home(),
                Home(),
              ],
              controller: this.tabController,
            ),
          ],
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Color.fromRGBO(46, 46, 46, 1),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: TabBar(
            //color del indicador donde esta
            indicatorColor: Colors.transparent,
            //color de los no seleccionados
            unselectedLabelColor: Colors.white,
            //color de seleccion
            labelColor: Color.fromRGBO(13, 206, 225, 1),
            //
            labelStyle: TextStyle(fontSize: 10),
            //
            labelPadding: const EdgeInsets.all(0.0),
            tabs: [
              Tab(
                icon: Icon(
                  Icons.house,
                  size: 25,
                ),
                text: 'Inicio',
              ),
              Tab(
                icon: Icon(
                  Icons.star,
                  size: 25,
                ),
                text: 'Favoritos',
              ),
              Tab(
                icon: Icon(
                  Icons.favorite_outlined,
                  size: 25,
                ),
                text: 'Notificacion',
              ),
              Tab(
                icon: Icon(
                  Icons.apps_outlined,
                  size: 25,
                ),
                text: 'Mas',
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
