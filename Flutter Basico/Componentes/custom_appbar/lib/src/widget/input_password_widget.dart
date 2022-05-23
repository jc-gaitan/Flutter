import 'package:flutter/material.dart';

class InputPasswordWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool _passwordVisible = false;
    return StatefulBuilder(builder: (_context, _setState) {
      return TextFormField(
        //color del texto
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
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
  }
}
