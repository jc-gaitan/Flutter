import 'package:custom_appbar/src/widget/boton_icon_widget.dart';
import 'package:custom_appbar/src/widget/boton_rounded_widget.dart';
import 'package:custom_appbar/src/widget/input_password_widget.dart';
import 'package:custom_appbar/src/widget/input_widget.dart';
import 'package:custom_appbar/src/widget/logoGym_widget.dart';
import 'package:custom_appbar/src/widget/texto_widget.dart';
import 'package:flutter/material.dart';

import 'package:custom_appbar/src/widget/fondo_widget.dart';

class RegistroPage extends StatefulWidget {
  @override
  _RegistroPageState createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  bool _valorMasculino = false;
  bool _valorFemenino = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar transparente
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      //para que el contenido no se cambie cuando el teclado sale
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Registro',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          FondoWidget(),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 100.0),
              child: Column(
                children: [
                  LogoGymWidget(),
                  SizedBox(
                    height: 20.0,
                  ),
                  InputWidget(Icons.person, 'Nombre'),
                  SizedBox(
                    height: 10.0,
                  ),
                  InputWidget(Icons.email, 'Email'),
                  SizedBox(
                    height: 10.0,
                  ),
                  InputPasswordWidget(),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Femenino',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      //checkBox
                      Theme(
                          data: ThemeData(unselectedWidgetColor: Colors.white),
                          child: Checkbox(
                              //color icono -> chulito cuando esta activo
                              checkColor: Colors.white,
                              //backgraoun cuando esta activo
                              activeColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                              value: _valorFemenino,
                              onChanged: (valor) {
                                setState(() {
                                  _valorFemenino = valor!;
                                  (_valorFemenino)
                                      ? _valorMasculino = false
                                      : _valorMasculino = true;
                                });
                              })),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'Masculino',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Theme(
                          data: ThemeData(unselectedWidgetColor: Colors.white),
                          child: Checkbox(
                              //color icono -> chulito cuando esta activo
                              checkColor: Colors.white,
                              //backgraoun cuando esta activo
                              activeColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                              value: _valorMasculino,
                              onChanged: (valor) {
                                setState(() {
                                  _valorMasculino = valor!;
                                  (_valorMasculino)
                                      ? _valorFemenino = false
                                      : _valorFemenino = true;
                                });
                              })),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BotonRoundedWidget('Registrarse', () => {}),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextoLRWidget('Registrarse con: ', Alignment.centerLeft,
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
                      TextoLRWidget('Ya tienes cuenta? ', Alignment.centerLeft,
                          Colors.white, ''),
                      SizedBox(
                        width: 6.0,
                      ),
                      TextoLRWidget('Iniciar sesión ', Alignment.centerLeft,
                          Color.fromRGBO(255, 202, 49, 1.0), 'pop'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
