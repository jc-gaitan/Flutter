import 'package:flutter/material.dart';

bool isNumeric(String s) {
  if (s.isEmpty) return false;

  //intentar convertir a s en numero, si el resultado es null no se puede convertir en numero
  final n = num.tryParse(s);

  return (n == null) ? false : true;
}

void mostrarAlerta(BuildContext context, String mensaje) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(mensaje),
          actions: [
            TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Ok')),
          ],
        );
      });
}
