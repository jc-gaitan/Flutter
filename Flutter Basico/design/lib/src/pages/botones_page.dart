import 'package:flutter/material.dart';

import 'dart:math';
import 'dart:ui';

class BotonesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _fondoApp(),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _titulos(),
                _botonesRedondiados(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }

  Widget _botonesRedondiados() {
    return Table(
      children: [
        TableRow(
          children: [
            _crearBoton(Colors.blue, Icons.ac_unit, 'general'),
            _crearBoton(Colors.red, Icons.access_alarm, 'alarma'),
          ],
        ),
        TableRow(
          children: [
            _crearBoton(Colors.green, Icons.train, 'train'),
            _crearBoton(Colors.pink, Icons.access_time_sharp, 'time'),
          ],
        ),
        TableRow(
          children: [
            _crearBoton(
                Colors.blueGrey, Icons.account_tree_outlined, 'account'),
            _crearBoton(Colors.yellow, Icons.movie, 'movie'),
          ],
        ),
        TableRow(
          children: [
            _crearBoton(Colors.black, Icons.tab, 'tab'),
            _crearBoton(Colors.deepOrange, Icons.cloud, 'cloud'),
          ],
        ),
      ],
    );
  }

  Widget _crearBoton(Color color, IconData icon, String text) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          height: 180.0,
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Color.fromRGBO(62, 66, 107, 0.7),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 5.0,
              ),
              CircleAvatar(
                backgroundColor: color,
                radius: 35.0,
                child: Icon(icon, color: Colors.white, size: 30.0),
              ),
              Text(text, style: TextStyle(color: color)),
              SizedBox(
                height: 5.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        //cambiar el color de fondo
        canvasColor: Color.fromRGBO(55, 57, 84, 1.0),
        //cambiar el color primario
        primaryColor: Colors.pinkAccent,
        //cambiar el color de los demas iconoes
        textTheme: Theme.of(context).textTheme.copyWith(
              caption: TextStyle(color: Color.fromRGBO(116, 117, 152, 1.0)),
            ),
      ),
      child: BottomNavigationBar(
        //ocultar el label del los items
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_today,
              size: 30.0,
            ),
            label: "calendar_today",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.pie_chart_outline,
              size: 30.0,
            ),
            label: "pie_chart_outline",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.supervised_user_circle,
              size: 30.0,
            ),
            label: "supervised_user_circle",
          ),
        ],
      ),
    );
  }

  Widget _titulos() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Classify transaction",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Classify this transaction into a particular category",
              style: TextStyle(color: Colors.white, fontSize: 15.0),
            ),
          ],
        ),
      ),
    );
  }

  Widget _fondoApp() {
    final gradiente = new Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset(0.0, 0.6),
          end: FractionalOffset(0.0, 1.0),
          colors: [
            Color.fromRGBO(52, 54, 101, 1.0),
            Color.fromRGBO(35, 37, 57, 1.0),
          ],
        ),
      ),
    );

    final cajaRosa = Transform.rotate(
      angle: -pi / 5.0,
      child: new Container(
        width: 360.0,
        height: 360.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80.0),
          gradient: LinearGradient(colors: [
            Color.fromRGBO(236, 98, 188, 1.0),
            Color.fromRGBO(241, 142, 172, 1.0),
          ]),
        ),
      ),
    );

    return Stack(
      children: [
        gradiente,
        Positioned(
          top: -100.0,
          child: cajaRosa,
        ),
      ],
    );
  }
}
