import 'package:flutter/material.dart';

import 'package:custom_appbar/src/widget/fondo_widget.dart';

class RecuperarPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar transparente
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Recuperar Contraseña',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          FondoWidget(),
        ],
      ),
    );
  }
}
