import 'package:flutter/material.dart';

import 'package:custom_appbar/src/widget/texto_widget.dart';
import 'package:custom_appbar/src/widget/fondo_widget.dart';
import 'package:custom_appbar/src/widget/boton_icon_widget.dart';
import 'package:custom_appbar/src/widget/logoGym_widget.dart';
import 'package:custom_appbar/src/widget/input_password_widget.dart';
import 'package:custom_appbar/src/widget/input_widget.dart';
import 'package:custom_appbar/src/widget/boton_rounded_widget.dart';

class LoginPage extends StatelessWidget {
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
          'Iniciar sesión',
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
                  TextoLRWidget(
                      'Iniciar con: ', Alignment.centerLeft, Colors.white, ''),
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
                      TextoLRWidget('No tienes cuenta? ', Alignment.centerLeft,
                          Colors.white, ''),
                      SizedBox(
                        width: 6.0,
                      ),
                      TextoLRWidget('Registrarse ', Alignment.centerLeft,
                          Color.fromRGBO(255, 202, 49, 1.0), 'registro'),
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

  void _iniciarSesion(BuildContext context) {
    Navigator.pushReplacementNamed(context, 'home');
  }

  /*
  Widget _logoGym() {
    return FadeInImage(
      placeholder: AssetImage('assets/jar-loading.gif'),
      image: NetworkImage(
          'https://www.havana-gym.com/wp-content/uploads/2017/06/weblogo.png'),
      fadeOutDuration: Duration(milliseconds: 200),
      height: 100,
      fit: BoxFit.cover,
    );
  }*/

  /*
  Widget _botonSocial(String text, String rutaIcon) {
    return Expanded(
      child: ElevatedButton.icon(
        icon: Image.asset(
          rutaIcon,
          width: 24.0,
          height: 24.0,
          fit: BoxFit.cover,
        ),
        onPressed: () {},
        label: Text(text),
        style: ElevatedButton.styleFrom(
          //color de boton
          primary: Color.fromRGBO(73, 73, 73, 1.0),
          //estilo
          shape: StadiumBorder(),
          //padding
          padding: EdgeInsets.symmetric(vertical: 12.0),
        ),
      ),
    );
  }*/

  /*
  void _navegation(BuildContext context, String ruta) {
    Navigator.pushNamed(context, 'registro');
    //print('Registrarse');
  }

  Widget _texto(String text, Alignment alignment, Color color,
      BuildContext context, String ruta) {
    return Container(
      //alineado a la izquierda
      alignment: alignment,
      //padding: EdgeInsets.only(right: 12.0),
      child: InkWell(
        onTap: () => (ruta.isEmpty) ? null : _navegation(context, ruta),
        child: Text(text,
            style: TextStyle(
              color: color,
              fontSize: 16.0,
              //fontWeight: FontWeight.bold,
            )),
      ),
    );
  }
  */

  /*
  Widget _fondo() {
    return Center(
        child: Container(
      width: double.infinity,
      height: double.infinity,
      child: Image(
        image: AssetImage("assets/fondo.png"),
        fit: BoxFit.cover,
      ),
    ));
  }*/

  /*
  Widget _crearPassword() {
    bool _passwordVisible = false; //variable para poder ver contraseña

    return StatefulBuilder(builder: (_context, _setState) {
      return TextFormField(
        //color del texto
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          //habilitar el color del fondo del input
          filled: true,
          //color del fondo del input
          fillColor: Color.fromRGBO(73, 73, 73, 0.5),
          //borde input sin seleccionar
          enabledBorder: OutlineInputBorder(
            //border redondeado
            borderRadius: BorderRadius.circular(30.0),
            //color border
            borderSide:
                BorderSide(width: 2.0, color: Color.fromRGBO(73, 73, 73, 0.5)),
          ),
          //border cuando el input esta seleccionado
          focusedBorder: OutlineInputBorder(
            //color border
            borderSide: const BorderSide(
                color: Color.fromRGBO(73, 73, 73, 1.0), width: 2.0),
            //borde redondeado
            borderRadius: BorderRadius.circular(30.0),
          ),
          //icon para ver contraseña
          suffixIcon: IconButton(
            color: Colors.white,
            icon: Icon(
              _passwordVisible ? Icons.visibility : Icons.visibility_off,
            ),
            padding: const EdgeInsets.only(right: 8),
            onPressed: () {
              // use _setState that belong to StatefulBuilder
              _setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          ),
          //hint
          labelText: 'Password',
          //cambiar color en el hint
          labelStyle: TextStyle(color: Colors.white),
          //icono de password --> candado
          prefixIcon: const Padding(
            padding: const EdgeInsets.only(top: 1.0, left: 8),
            child: const Icon(
              Icons.lock,
              color: Colors.white,
            ),
          ),
        ),
        //ocultar el password
        obscureText: !_passwordVisible,
      );
    });
  }*/

  /*
  Widget _crearEmail() {
    return TextFormField(
      //color del texto
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        //habilitar el color del fondo del input
        filled: true,
        //color del fondo del input
        fillColor: Color.fromRGBO(73, 73, 73, 0.5),
        //borde input sin seleccionar
        enabledBorder: OutlineInputBorder(
          //border redondeado
          borderRadius: BorderRadius.circular(30.0),
          //color border
          borderSide:
              BorderSide(width: 2.0, color: Color.fromRGBO(73, 73, 73, 0.5)),
        ),
        //border cuando el input esta seleccionado
        focusedBorder: OutlineInputBorder(
          //color border
          borderSide: const BorderSide(
              color: Color.fromRGBO(73, 73, 73, 1.0), width: 2.0),
          //borde redondeado
          borderRadius: BorderRadius.circular(30.0),
        ),
        //hint
        labelText: 'Email',
        //cambiar color en el hint
        labelStyle: TextStyle(color: Colors.white),
        //icono email
        prefixIcon: const Padding(
          padding: const EdgeInsets.only(top: 1.0, left: 8),
          child: const Icon(Icons.email, color: Colors.white),
        ),
      ),
    );
  }*/

  /*
  Widget _crearBoton() {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {},
        child: Text('Ingresar'),
        style: ElevatedButton.styleFrom(
          //color de boton
          primary: Color.fromRGBO(73, 73, 73, 1.0),
          //estilo
          shape: StadiumBorder(),
          //padding
          padding: EdgeInsets.symmetric(vertical: 16.0),
        ),
      ),
    );
  }*/
}
