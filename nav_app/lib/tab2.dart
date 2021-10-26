import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nav_app/page2.dart';

import 'home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  var currentIndex = 0;

  final List<Widget> _tabItems = [
    const Home(),
    const Home2(),
    const Home(),
    const Home2(),
  ];

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      //appbar transparente
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      //para que el contenido no se cambie cuando el teclado sale
      resizeToAvoidBottomInset: false,
      body: _tabItems[currentIndex],
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(
          right: displayWidth * .04,
          left: displayWidth * .04,
          bottom: displayWidth * .05,
          top: displayWidth * .01,
        ),
        height: displayWidth * .155,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(
              46, 46, 46, 1), //TODO: aca se cambia el color de tab
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(50),
        ),
        child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: displayWidth * .02),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              setState(() {
                currentIndex = index;
                HapticFeedback.lightImpact();
              });
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Stack(
              children: [
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: index == currentIndex
                      ? displayWidth * .32
                      : displayWidth * .18,
                  alignment: Alignment.center,
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    height: index == currentIndex ? displayWidth * .12 : 0,
                    width: index == currentIndex ? displayWidth * .32 : 0,
                    decoration: BoxDecoration(
                      color: index == currentIndex
                          ? const Color.fromRGBO(13, 206, 225, 1)
                              .withOpacity(.2) //TODO: colo fondo seleccionado
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: index == currentIndex
                      ? displayWidth * .31
                      : displayWidth * .18,
                  //alignment: Alignment.center,
                  child: Stack(
                    children: [
                      //texto
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            width: index == currentIndex
                                ? displayWidth * (tam(currentIndex) + .09)
                                : 0,
                          ),
                          AnimatedOpacity(
                            opacity: index == currentIndex ? 1 : 0,
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            child: Text(
                              index == currentIndex ? listOfStrings[index] : '',
                              style: const TextStyle(
                                color: const Color.fromRGBO(13, 206, 225,
                                    1), //TODO: cambiar color texto seleccionado
                                fontWeight: FontWeight.w600,
                                fontSize: 11, //TODO: CAMBIAR TAMAÑO TEXTO
                              ),
                            ),
                          ),
                        ],
                      ),
                      //icon
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            width: index == currentIndex
                                ? displayWidth * tam(currentIndex)
                                : 20,
                          ),
                          Icon(
                            listOfIcons[index],
                            size: displayWidth * .076,
                            color: index == currentIndex
                                ? const Color.fromRGBO(
                                    13, 206, 225, 1) //TODO: CAMBIAR COLOR TEXTO
                                : Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  double tam(int x) {
    if (x == 0) {
      return 0.06;
    } else if (x == 3) {
      return 0.08;
    } else {
      return 0.03;
    }
  }

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.favorite_rounded,
    Icons.mark_email_unread_outlined,
    Icons.apps_outlined,
  ];

  List<String> listOfStrings = [
    'Inicio',
    'Favoritos',
    'Notificación',
    'Mas',
  ];
}
