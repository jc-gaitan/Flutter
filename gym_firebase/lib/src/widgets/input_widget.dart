import 'package:flutter/material.dart';
import 'package:gym_firebase/src/models/user_model.dart';
import 'package:gym_firebase/src/utils/validaciones.dart';

Widget input(IconData? icon, String text, UserModel usuario, Color colorTexto,
    Color colorFondo) {
  return TextFormField(
    //onSaved se ejecuta solo cuando el campo cumple con las validaciones
    onSaved: (value) {
      if (text == 'Email') {
        usuario.email = value!.toLowerCase();
      } else if (text == 'Nombre') {
        usuario.nombre = value!;
      } else if (text == 'Estatura') {
        usuario.estatura = value! + 'm';
      } else if (text == 'Peso') {
        usuario.peso = value! + 'Kg';
      } else if (text == 'Edad') {
        usuario.edad = value!;
      }
    },
    validator: (value) {
      if (text == 'Email') {
        if (isEmail(value!.trim())) {
          return null;
        } else {
          return 'Por favor ingrese un email valido. ';
        }
      } else if (text == 'Nombre') {
        if (value!.trim().length > 2) {
          return null;
        } else {
          return 'Por favor ingrese un nombre valido. ';
        }
      } else if (text == 'Estatura') {
        if (estaturaValida(value!)) {
          return null;
        } else {
          return 'Por favor ingrese una estatura valida. ';
        }
      } else if (text == 'Peso') {
        if (pesoValido(value!)) {
          return null;
        } else {
          return 'Por favor ingrese un peso valido. ';
        }
      } else if (text == 'Edad') {
        if (edadValida(value!)) {
          return null;
        } else {
          return 'Por favor ingrese una edad valida. ';
        }
      }
    },

    textCapitalization:
        (text != 'Email') ? TextCapitalization.words : TextCapitalization.none,

    //color del texto
    style: TextStyle(color: colorTexto),

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
      contentPadding: EdgeInsets.symmetric(vertical: 15.0),
      //habilitar el color del fondo del input
      filled: true,
      //color del fondo del input
      fillColor: colorFondo,

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
        borderSide: BorderSide(
          color: Color.fromRGBO(73, 73, 73, 1.0),
          width: 2.0,
        ),
        //borde redondeado
        borderRadius: BorderRadius.circular(30.0),
      ),

      //hint
      labelText: text,
      //cambiar color en el hint
      labelStyle: TextStyle(color: colorTexto),

      //icono del input
      prefixIcon: Padding(
        padding: EdgeInsets.only(top: 1.0, left: 8.0),
        child: (icon == null) ? null : Icon(icon, color: colorTexto),
      ),
    ),
  );
}
