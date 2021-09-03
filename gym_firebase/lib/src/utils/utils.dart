import 'package:flutter/material.dart';

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
