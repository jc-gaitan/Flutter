import 'package:flutter/material.dart';

import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

class NoticiasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appbar transparente
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        //para que el contenido no se cambie cuando el teclado sale
        resizeToAvoidBottomInset: false,
        /*appBar: AppBar(
        title: Text(
          'Noticias',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),*/
        body: SafeArea(child: _swiper()));
  }

  Widget _swiper() {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.network(
              "https://i.pinimg.com/originals/fa/d6/57/fad657dc45b0aa38f27c9a68c6304e2c.jpg",
              fit: BoxFit.cover,
              //width: 100,
            ),
          ),
        );
      },
      itemCount: 10,
      viewportFraction: 0.8,
      scale: 0.9,
      autoplay: true,
      duration: 1000,
    );
  }
}
