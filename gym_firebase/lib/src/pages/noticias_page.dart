import 'package:flutter/material.dart';

import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:gym_firebase/src/bloc/provider.dart';
import 'package:gym_firebase/src/models/noticias_model.dart';
import 'package:gym_firebase/src/models/user_model.dart';
import 'package:gym_firebase/src/providers/noticias_provider.dart';

class NoticiasPage extends StatelessWidget {
  final noticiasProvider = new NoticiasProvider();

  final tituloController = TextEditingController();
  final mensajeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.userBloc(context);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      //appbar transparente
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      //para que el contenido no se cambie cuando el teclado sale
      resizeToAvoidBottomInset: false,
      body: FutureBuilder(
        future: noticiasProvider.cargarNoticias(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return SafeArea(
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: _swiper(
                  screenHeight,
                  screenWidth,
                  userBloc.user,
                  snapshot.data,
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget _swiper(double screenHeight, double screenWidth, UserModel user,
      List<NoticiasModel> noticias) {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return _contenido(
            screenHeight, screenWidth, user, context, noticias[index]);
      },
      itemCount: noticias.length,
      viewportFraction: 0.8,
      scale: 0.9,
      autoplay: true,
      duration: 1000,
      itemWidth: screenWidth * 0.8,
      itemHeight: screenHeight * 0.9,
    );
  }

  void _crearNoticia(BuildContext context) {
    //String ingresado = '';
    showDialog(
      context: context,
      //true -> cierra el dialog al dar clic fuera de el
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          //borde redondiado
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text(
            "Crear Noticia",
            //centrar texto
            textAlign: TextAlign.center,
          ),
          content: Column(
            //tamaño de la columna max -> maximo, min -> se adapta altamaño del contenido que tenga dentro
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Titulo',
                ),
                controller: tituloController,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Mensaje',
                ),
                controller: mensajeController,
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text("Cancelar"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text("Guardar"),
              onPressed: () {
                NoticiasModel noticia = new NoticiasModel(
                    titulo: tituloController.text,
                    mensaje: mensajeController.text,
                    fotoUrl:
                        'https://firebasestorage.googleapis.com/v0/b/flutter-app-8f08b.appspot.com/o/noticias%2Fno_image.jpg?alt=media&token=3e9fc267-e26d-446d-be14-683486b7b51f');

                noticiasProvider.crearNoticia(noticia);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _contenido(double screenHeight, double screenWidth, UserModel user,
      BuildContext context, NoticiasModel noticias) {
    return GestureDetector(
      onTap: (user.tipo == 'admin') ? () => _crearNoticia(context) : () {},
      child: Container(
        //margin: EdgeInsets.symmetric(vertical: screenHeight * 0.0125),
        //height: screenHeight * 0.9,
        //width: double.infinity,
        /*decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.red,
        ),*/
        child: Stack(
          children: [
            _fondo(screenHeight, screenWidth, noticias),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _text(
                  noticias.titulo.toUpperCase(),
                  20.0,
                  true,
                ),
                SizedBox(height: 5.0),
                _text(
                  noticias.mensaje,
                  16.0,
                  false,
                ),
                SizedBox(height: screenHeight * 0.1232),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _fondo(
      double screenHeight, double screenWidth, NoticiasModel noticias) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: FadeInImage(
        placeholder: AssetImage('assets/loading.gif'),
        image: NetworkImage(noticias.fotoUrl),
        width: screenWidth * 0.8,
        height: screenHeight * 0.9,
        fit: BoxFit.cover,
        imageErrorBuilder: (context, exception, stackTrace) {
          print('Error Handler');
          return ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Container(
              width: screenWidth * 0.8,
              height: screenHeight * 0.9,
              child: Image.asset(
                'assets/errorBig.jpg',
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _text(String text, double size, bool negrita) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: (negrita) ? FontWeight.w600 : FontWeight.normal,
          color: Colors.white,
          fontSize: size,
          height: 1.0,
          shadows: [
            Shadow(
              color: Colors.black,
              offset: Offset(3.0, 3.0),
              blurRadius: 5.0,
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
