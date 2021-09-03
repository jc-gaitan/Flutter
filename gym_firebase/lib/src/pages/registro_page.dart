import 'package:flutter/material.dart';
import 'package:gym_firebase/src/models/user_model.dart';
import 'package:gym_firebase/src/providers/auth_provider.dart';
import 'package:gym_firebase/src/providers/user_provider.dart';
import 'package:gym_firebase/src/utils/utils.dart';

//import 'package:gym_firebase/src/widgets/button_icon_widget.dart';
import 'package:gym_firebase/src/widgets/button_rounded_widget.dart';
import 'package:gym_firebase/src/widgets/fondo_widget.dart';
import 'package:gym_firebase/src/widgets/input_password_widget.dart';
import 'package:gym_firebase/src/widgets/input_widget.dart';
//import 'package:gym_firebase/src/widgets/logo_gym_widget.dart';
import 'package:gym_firebase/src/widgets/text_login_widget.dart';

class RegistroPage extends StatefulWidget {
  @override
  _RegistroPageState createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  final AuthProvider authProvider = new AuthProvider();

  final formKey = GlobalKey<FormState>();

  UserModel usuario = new UserModel();

  UserProvider userProvider = new UserProvider();

  bool _valorMasculino = true;
  bool _valorFemenino = false;

  @override
  Widget build(BuildContext context) {
    final _scrollViewController = ScrollController();

    final data = MediaQuery.of(context);

    double screenHeight = data.size.height;

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
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      //logoGym(),
                      //SizedBox(height: 15.0),
                      SizedBox(height: screenHeight * 0.20),
                      _formulario(),
                      //_registroSocial(),
                      SizedBox(
                        height: 6.0,
                      ),
                      Row(
                        children: [
                          textLogin(
                            'Ya tienes cuenta? ',
                            16.0,
                            Alignment.centerLeft,
                            Colors.white,
                            () {},
                          ),
                          SizedBox(
                            width: 6.0,
                          ),
                          textLogin(
                            'Iniciar Sesion ',
                            16.0,
                            Alignment.centerLeft,
                            Color.fromRGBO(255, 202, 49, 1.0),
                            () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /*
  Widget _registroSocial() {
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

  Widget _formulario() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          input(
            Icons.person,
            'Nombre',
            usuario,
            Colors.white,
            Color.fromRGBO(73, 73, 73, 0.5),
          ),
          SizedBox(height: 15.0),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Masculino',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                width: 5.0,
              ),
              _checkBoxHombre(),
              SizedBox(
                width: 10.0,
              ),
              Text(
                'Femenino',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                width: 5.0,
              ),
              _checkBoxMujer(),
            ],
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buttonRounded(
                'Registrarse',
                () => _registrarse(context),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _appBar(bool innerBoxIsScrolled) {
    return SliverAppBar(
      title: new Text(
        'Registro',
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

  Widget _checkBoxMujer() {
    return Theme(
      data: ThemeData(unselectedWidgetColor: Colors.white),
      child: Checkbox(
        //color icono -> chulito cuando esta activo
        checkColor: Colors.white,
        //backgraoun cuando esta activo
        activeColor: Colors.red,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        value: _valorFemenino,
        onChanged: (valor) {
          setState(() {
            _valorFemenino = valor!;
            (_valorFemenino) ? _valorMasculino = false : _valorMasculino = true;
          });
        },
      ),
    );
  }

  Widget _checkBoxHombre() {
    return Theme(
      data: ThemeData(unselectedWidgetColor: Colors.white),
      child: Checkbox(
        //color icono -> chulito cuando esta activo
        checkColor: Colors.white,
        //backgraoun cuando esta activo
        activeColor: Colors.red,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        value: _valorMasculino,
        onChanged: (valor) {
          setState(() {
            _valorMasculino = valor!;
            (_valorMasculino) ? _valorFemenino = false : _valorFemenino = true;
          });
        },
      ),
    );
  }

  _registrarse(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;

    /* Si el formulario no es valido no ejecuta las demas lineas de codigo */

    //print("Formulario valido");

    //ejecuta en onSaved de los TextFiel
    formKey.currentState!.save();

    /*print('email: ${usuario.email}');
    print('email: ${usuario.x}');
    print('email: ${usuario.nombre}');*/

    final info = await authProvider.crearUser(usuario.email, usuario.x);

    if (_valorMasculino) {
      usuario.sexo = 'Masculino';
    } else {
      usuario.sexo = 'Femenino';
    }

    //crear asistencia vacia
    List<Asistencia> asistencia = [];
    asistencia.add(new Asistencia(dia: "01", mes: "01", year: "2001"));
    usuario.asistencia = asistencia;

    //crear medidas vacia
    List<Medidas> medidas = [];
    medidas.add(new Medidas());
    usuario.medidas = medidas;

    if (info['ok']) {
      //creear el usuario
      userProvider.crearUsuario(usuario);
      mostrarSnackBar('Se ha creado la cuenta con exito. ');
      //para no devolverse dando clic en el boton de atras
      Navigator.pushReplacementNamed(context, '/');
    } else {
      mostrarAlerta(context, info['mensaje']);
    }
  }

  void mostrarSnackBar(String mensaje) {
    final snackbar = SnackBar(
      content: Text(mensaje),
      duration: Duration(milliseconds: 1000),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
