import 'package:flutter/material.dart';
import 'package:gym_firebase/src/models/user_model.dart';
import 'package:gym_firebase/src/utils/validaciones.dart';

Widget inputPassword(UserModel usuario) {
  bool _passwordVisible = false;

  return StatefulBuilder(builder: (_context, _setState) {
    return TextFormField(
      //onSaved se ejecuta solo cuando el campo cumple con las validaciones
      onSaved: (value) => usuario.x = value!,
      validator: (value) {
        if (password(value!.trim())) {
          return null;
        } else {
          return 'La contraseña debe ser minimo de 6 caracteres. ';
        }
      },

      //color del texto
      style: TextStyle(color: Colors.white),

      decoration: InputDecoration(
        border: OutlineInputBorder(
          //border redondeado
          borderRadius: BorderRadius.circular(30.0),
          //color border
          borderSide: BorderSide(
            width: 1.0,
            color: Color.fromRGBO(227, 20, 20, 1.0),
          ),
        ),

        //estilo del texto del error
        errorStyle: TextStyle(
          //alto del texto error
          height: 0.6,
          //color: Colors.white,
          fontSize: 12,
          shadows: [
            Shadow(
              color: Colors.black,
              offset: Offset(3.0, 3.0),
              blurRadius: 5.0,
            ),
          ],
        ),

        //bordes del error
        errorBorder: OutlineInputBorder(
          //border redondeado
          borderRadius: BorderRadius.circular(30.0),
          //color border
          borderSide: BorderSide(
            width: 1.0,
            color: Color.fromRGBO(227, 20, 20, 1.0),
          ),
        ),

        //para reducir el ancho de textfield
        contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
        //habilitar el color del fondo del input
        filled: true,
        //color del fondo del input
        fillColor: Color.fromRGBO(73, 73, 73, 0.5),
        //borde input sin seleccionar

        enabledBorder: OutlineInputBorder(
          //border redondeado
          borderRadius: BorderRadius.circular(30.0),
          //color border
          borderSide: BorderSide(
            width: 2.0,
            color: Color.fromRGBO(73, 73, 73, 0.5),
          ),
        ),

        //border cuando el input esta seleccionado
        focusedBorder: OutlineInputBorder(
          //color border
          borderSide: const BorderSide(
            color: Color.fromRGBO(73, 73, 73, 1.0),
            width: 2.0,
          ),
          //borde redondeado
          borderRadius: BorderRadius.circular(30.0),
        ),
        //icon para ver contraseña
        suffixIcon: IconButton(
          color: Colors.white,
          icon: Icon(
            _passwordVisible ? Icons.visibility : Icons.visibility_off,
          ),
          padding: EdgeInsets.only(right: 8),
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
        prefixIcon: Padding(
          padding: EdgeInsets.only(top: 1.0, left: 8),
          child: Icon(
            Icons.lock,
            color: Colors.white,
          ),
        ),
      ),

      //ocultar el password
      obscureText: !_passwordVisible,
    );
  });
}
