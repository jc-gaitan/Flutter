import 'package:flutter/material.dart';
import 'package:gym_firebase/src/bloc/provider.dart';
import 'package:gym_firebase/src/models/user_model.dart';
import 'package:gym_firebase/src/providers/auth_provider.dart';
import 'package:gym_firebase/src/utils/utils.dart';

//import 'package:gym_firebase/src/widgets/button_icon_widget.dart';
import 'package:gym_firebase/src/widgets/button_rounded_widget.dart';
import 'package:gym_firebase/src/widgets/fondo_widget.dart';
import 'package:gym_firebase/src/widgets/input_password_widget.dart';
import 'package:gym_firebase/src/widgets/input_widget.dart';
//import 'package:gym_firebase/src/widgets/logo_gym_widget.dart';
import 'package:gym_firebase/src/widgets/text_login_widget.dart';

class LoginPage extends StatelessWidget {
  final AuthProvider authProvider = new AuthProvider();

  final formKey = GlobalKey<FormState>();

  final UserModel usuario = new UserModel();

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.userBloc(context);
    final data = MediaQuery.of(context);

    double screenHeight = data.size.height;

    final _scrollViewController = ScrollController();

    return MediaQuery(
      //para que el texto no se ajuste al tamaño del texto del celular
      data: data.copyWith(textScaleFactor: 1.0),
      child: Scaffold(
          //appbar transparente
          backgroundColor: Colors.transparent,
          extendBodyBehindAppBar: true,
          //para que el contenido no se cambie cuando el teclado sale
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              fondo(),
              NestedScrollView(
                controller: _scrollViewController,
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    _appBar(innerBoxIsScrolled),
                  ];
                },
                body: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      children: [
                        //titulo(),
                        //logoGym(),
                        //SizedBox(height: 15.0),
                        SizedBox(height: screenHeight * 0.23),
                        _formulario(context, userBloc),
                        //_loginSocial(),
                        SizedBox(
                          height: 6.0,
                        ),
                        Row(
                          children: [
                            textLogin(
                              'No tienes cuenta? ',
                              16.0,
                              Alignment.centerLeft,
                              Colors.white,
                              () {},
                            ),
                            SizedBox(
                              width: 6.0,
                            ),
                            textLogin(
                              'Registrarse ',
                              16.0,
                              Alignment.centerLeft,
                              Color.fromRGBO(255, 202, 49, 1.0),
                              () => _registro(context),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }

  /*
  Widget _loginSocial() {
    return Column(
      children: [
        SizedBox(
          height: 15.0,
        ),
        textLogin(
          'Iniciar con: ',
          18.0,
          Alignment.centerLeft,
          Colors.white,
          () {},
        ),
        SizedBox(
          height: 6.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buttonIcon(
              'Facebook',
              "assets/iconFacebook.png",
              () {},
            ),
            SizedBox(
              width: 6.0,
            ),
            buttonIcon(
              'Google',
              "assets/iconGmail.png",
              () {},
            ),
          ],
        ),
      ],
    );
  }*/

  Widget _appBar(bool innerBoxIsScrolled) {
    return SliverAppBar(
      title: new Text(
        'Iniciar sesion',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      pinned: false,
      floating: true,
      forceElevated: innerBoxIsScrolled,
    );
  }

  Widget _formulario(BuildContext context, UserBloc userBloc) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          input(
            Icons.email,
            'Email',
            usuario,
            Colors.white,
            Color.fromRGBO(73, 73, 73, 0.5),
          ),
          SizedBox(height: 15.0),
          inputPassword(usuario),
          SizedBox(height: 5.0),
          textLogin(
            '¿Olvidaste la contraseña?',
            16.0,
            Alignment.centerRight,
            Colors.white,
            () {},
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buttonRounded(
                'Ingresar',
                () => _iniciarSesion(context, userBloc),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /*Widget titulo() {
    return Container(
      margin: EdgeInsets.only(top: 20.0, bottom: 10.0),
      child: Text(
        'Iniciar sesion',
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }*/

  void _registro(BuildContext context) {
    Navigator.pushNamed(context, 'registro');
  }

  _iniciarSesion(BuildContext context, UserBloc userBloc) async {
    if (!formKey.currentState!.validate()) return;

    /* Si el formulario no es valido no ejecuta las demas lineas de codigo */

    //print("Formulario valido");

    //ejecuta en onSaved de los TextFiel
    formKey.currentState!.save();

    //print('email: ${usuario.email}');
    //print('email: ${usuario.x}');

    //login --> solicitar token
    Map info = await authProvider.login(usuario.email.toLowerCase(), usuario.x);

    //verificar si el login fue correcto o dio error
    if (info['ok']) {
      //cargar usuario
      userBloc.cargarUser();

      //para no devolverse dando clic en el boton de atras
      Navigator.pushReplacementNamed(context, 'home');
      print("inicio sesion");
      usuario.x = '';
    } else {
      mostrarAlerta(context, info['mensaje']);
      print("Error");
    }
  }
}
