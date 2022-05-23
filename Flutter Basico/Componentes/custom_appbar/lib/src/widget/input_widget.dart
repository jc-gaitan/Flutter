import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final IconData icon;
  final String text;

  InputWidget(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
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
        //hint
        labelText: text,
        //cambiar color en el hint
        labelStyle: TextStyle(color: Colors.white),
        //icono email
        prefixIcon: Padding(
          padding: EdgeInsets.only(top: 1.0, left: 8),
          child: Icon(icon, color: Colors.white),
        ),
      ),
    );
  }
}
