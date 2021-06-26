import 'package:flutter/material.dart';
import 'package:formvalidation/src/bloc/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _crearFondo(context),
          _loginForm(context),
        ],
      ),
    );
  }

  Widget _loginForm(BuildContext context) {
    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(
              child: Container(
            height: 180.0,
          )),
          Container(
            width: size.width * 0.85,
            padding: EdgeInsets.symmetric(vertical: 50.0),
            margin: EdgeInsets.symmetric(vertical: 30.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3.0,
                  offset: Offset(0.0, 5.0),
                  spreadRadius: 3.0,
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  'Ingreso',
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(height: 60.0),
                _crearEmail(bloc),
                SizedBox(height: 30.0),
                _crearPassword(bloc),
                SizedBox(height: 30.0),
                _crearBoton(bloc),
              ],
            ),
          ),
          Text('¿Olvido la contraseña?'),
          SizedBox(height: 50.0),
        ],
      ),
    );
  }

  Widget _crearEmail(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon(
                Icons.alternate_email,
                color: Colors.deepPurple,
              ),
              hintText: 'ejemplo@email.com',
              labelText: 'Correo Electronico',
              counterText: snapshot.data,
              errorText: snapshot.hasError ? snapshot.error.toString() : null,
            ),
            onChanged: bloc.changeEmail,
          ),
        );
      },
    );
  }

  Widget _crearPassword(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(
                Icons.lock_outlined,
                color: Colors.deepPurple,
              ),
              labelText: 'Contraseña',
              counterText: snapshot.data,
              errorText: snapshot.hasError ? snapshot.error.toString() : null,
            ),
            onChanged: bloc.changePassword,
          ),
        );
      },
    );
  }

  Widget _crearBoton(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ElevatedButton(
          onPressed: snapshot.hasData ? () => _login(bloc, context) : null,
          child: Text('Iniciar Sesion'),
          style: ElevatedButton.styleFrom(
            primary: Colors.deepPurple,
            shape: StadiumBorder(),
            padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
          ),
        );
      },
    );
  }

  _login(LoginBloc bloc, BuildContext context) {
    //para no devolverse dando clic en el boton de atras
    Navigator.pushReplacementNamed(context, 'home');
  }

  Widget _crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final _fondoMorado = Container(
      //40% del tamaño de la pantalla
      height: size.height * 0.4,
      width: double.infinity,

      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            Color.fromRGBO(63, 63, 156, 1.0),
            Color.fromRGBO(90, 70, 178, 1.0),
          ],
        ),
      ),
    );

    final _circulos = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(255, 255, 255, 0.1),
      ),
    );

    return Stack(
      children: [
        _fondoMorado,
        Positioned(
          child: _circulos,
          top: 90.0,
          left: 30.0,
        ),
        Positioned(
          child: _circulos,
          top: -50.0,
          right: -30.0,
        ),
        Container(
          padding: EdgeInsets.only(top: 80.0),
          child: Column(
            children: [
              Icon(
                Icons.person_pin_circle,
                color: Colors.white,
                size: 100.0,
              ),
              SizedBox(
                height: 10.0,
                width: double.infinity,
              ),
              Text(
                'Login Yooxy',
                style: TextStyle(color: Colors.white, fontSize: 25.0),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
