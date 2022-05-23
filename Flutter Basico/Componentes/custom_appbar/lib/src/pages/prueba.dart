import 'package:custom_appbar/src/utils/widgets.dart';
import 'package:custom_appbar/src/widget/boton_icon_widget.dart';
import 'package:custom_appbar/src/widget/boton_rounded_widget.dart';
import 'package:custom_appbar/src/widget/input_password_widget.dart';
import 'package:custom_appbar/src/widget/input_widget.dart';
import 'package:custom_appbar/src/widget/logoGym_widget.dart';
import 'package:custom_appbar/src/widget/texto_widget.dart';
import 'package:flutter/material.dart';

class PruebaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _scrollViewController = ScrollController();
    return new Scaffold(
      //appbar transparente
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      //para que el contenido no se cambie cuando el teclado sale
      resizeToAvoidBottomInset: false,
      body: new NestedScrollView(
        controller: _scrollViewController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            new SliverAppBar(
              title: new Text(
                'Prueba',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              pinned: false,
              floating: true,
              forceElevated: innerBoxIsScrolled,
              /*bottom: new TabBar(
                tabs: <Tab>[
                  new Tab(text: "STATISTICS"),
                  new Tab(text: "HISTORY"),
                ],
                controller: _tabController,
              ),*/
            ),
          ];
        },
        body: Stack(
          children: [
            //FondoWidget(),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    LogoGymWidget(),
                    SizedBox(
                      height: 10.0,
                    ),
                    InputWidget(Icons.email, 'Email'),
                    SizedBox(
                      height: 10.0,
                    ),
                    InputPasswordWidget(),
                    SizedBox(
                      height: 6.0,
                    ),
                    TextoLRWidget('¿Olvidaste la contraseña?',
                        Alignment.centerRight, Colors.white, 'recuperar'),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BotonRoundedWidget(
                            'Ingresar', () => _iniciarSesion(context)),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextoLRWidget('Iniciar con: ', Alignment.centerLeft,
                        Colors.white, ''),
                    SizedBox(
                      height: 6.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BotonIconWidget('Facebook', "assets/iconFacebook.png"),
                        SizedBox(
                          width: 6.0,
                        ),
                        BotonIconWidget('Google', "assets/iconGmail.png"),
                      ],
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    Row(
                      children: [
                        TextoLRWidget('No tienes cuenta? ',
                            Alignment.centerLeft, Colors.white, ''),
                        SizedBox(
                          width: 6.0,
                        ),
                        TextoLRWidget('Registrarse ', Alignment.centerLeft,
                            Color.fromRGBO(255, 202, 49, 1.0), 'registro'),
                      ],
                    ),
                    asd(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _iniciarSesion(BuildContext context) {
    Navigator.pushReplacementNamed(context, 'home');
  }
}
