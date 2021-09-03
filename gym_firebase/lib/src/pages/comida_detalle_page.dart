import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gym_firebase/src/models/nutricion_model.dart';

class ComidaDetalle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ComidaModel comida =
        ModalRoute.of(context)!.settings.arguments as ComidaModel;

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final data = MediaQuery.of(context);

    return MediaQuery(
      data: data.copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        //appbar transparente
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        //para que el contenido no se cambie cuando el teclado sale
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            comida.nombre,
            style: TextStyle(
              shadows: [
                Shadow(
                  color: Colors.black,
                  offset: Offset(3.0, 3.0),
                  blurRadius: 5.0,
                ),
              ],
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Stack(
          children: [
            Positioned(
              top: 0.0,
              right: 0.0,
              left: 0.0,
              child: Container(
                //padding: EdgeInsets.all(60.0),
                width: screenWidth,
                height: screenHeight * 0.4,
                color: Colors.red,
                child: Stack(
                  children: [
                    img2(comida.urlFoto, screenWidth, screenHeight * 0.4),
                    Container(
                      padding: EdgeInsets.all(60.0),
                      child: Text(
                        comida.ideal,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              color: Colors.black,
                              offset: Offset(3.0, 3.0),
                              blurRadius: 5.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0.0,
              right: 0.0,
              left: 0.0,
              child: Container(
                width: screenWidth,
                height: screenHeight * 0.65,
                padding: EdgeInsets.only(
                  top: screenHeight * 0.18,
                  bottom: 30.0,
                  left: 30.0,
                  right: 30.0,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  color: Color.fromRGBO(105, 109, 110, 1),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5.0),
                      Text(
                        'Nutrición:',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      nutricion(comida.nutricion),
                      SizedBox(height: 20.0),
                      Center(
                        child: Text(
                          'Ingredientes: ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 5.0),
                      ingre(comida.ingredientes),
                      SizedBox(height: 20.0),
                      Center(
                        child: Text(
                          'Instrucciones: ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 5.0),
                      instru(comida.instrucciones),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.20,
              right: 0.0,
              left: 0.0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                width: screenWidth * 0.8333,
                height: screenHeight * 0.3203,
                //color: Colors.red,
                child: img(comida.urlFoto),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget instru(List<String> instru) {
    List<Widget> textos = [];
    instru.forEach((element) {
      textos.add(
        Text(
          element,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );
    });

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: textos,
      ),
    );
  }

  Widget ingre(List<String> ingre) {
    List<Widget> textos = [];
    ingre.forEach((element) {
      textos.add(Text(
        element,
        style: TextStyle(
          color: Colors.white,
        ),
      ));
    });

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: textos,
      ),
    );
  }

  Widget rowsNut(String txt1, String txt2, String icon) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 5.0),
      decoration: BoxDecoration(
        //color: Colors.red,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Color.fromRGBO(255, 230, 6, 0.6),
        ),
      ),
      child: Row(
        children: [
          ImageIcon(
            AssetImage(icon),
            size: 23.0,
            color: Colors.white,
          ),
          SizedBox(width: 2.0),
          Column(
            children: [
              Text(
                txt1,
                style: TextStyle(height: 1, color: Colors.white),
              ),
              SizedBox(width: 3.0),
              Text(
                txt2,
                style: TextStyle(height: 1, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget nutricion(List<String> nut) {
    List<Widget> rows = [];
    List<String> text = ['Calorías:', 'Proteina:', 'Carbohid:'];
    List<String> icons = [
      'assets/calorias.png',
      'assets/proteina.png',
      'assets/carbo.png'
    ];

    for (int i = 0; i < 3; i++) {
      rows.add(rowsNut(text[i], nut[i], icons[i]));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: rows,
    );
  }

  Widget img2(String url, double width, double height) {
    return Stack(
      children: [
        FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage(url),
          width: width,
          height: height,
          fit: BoxFit.cover,
          imageErrorBuilder: (context, exception, stackTrace) {
            print('Error Handler');
            return ClipRRect(
              //borderRadius: BorderRadius.circular(15.0),
              child: Container(
                //width: screenWidth * 0.8,
                //height: screenHeight * 0.9,
                child: Image.asset(
                  'assets/no-image.png',
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
        BackdropFilter(
          child: Container(
            color: Colors.black12,
          ),
          filter: ImageFilter.blur(sigmaY: 3.0, sigmaX: 3.0),
        )
      ],
    );
  }

  Widget img(String url) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: FadeInImage(
        placeholder: AssetImage('assets/loading.gif'),
        image: NetworkImage(url),
        //width: screenWidth * 0.8,
        //height: screenHeight * 0.9,
        fit: BoxFit.cover,
        imageErrorBuilder: (context, exception, stackTrace) {
          print('Error Handler');
          return ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Container(
              //width: screenWidth * 0.8,
              //height: screenHeight * 0.9,
              child: Image.asset(
                'assets/no-image.png',
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
