import 'package:flutter/material.dart';

class ProgresoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      //para que el contenido no se cambie cuando el teclado sale
      resizeToAvoidBottomInset: false,
      /*appBar: AppBar(
        title: Text('Mi Progreso'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),*/
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(top: 10.0),
                child: Text('Mi Progreso',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 10.0,
                  bottom: 8.0,
                ),
                //padding: EdgeInsets.only(top: 10.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://hipertextual.com/wp-content/uploads/2018/11/Stan-Lee.jpg'),
                  radius: 40.0,
                  foregroundColor: Colors.white,
                ),
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  border: new Border.all(
                    color: Colors.white,
                    width: 2.0,
                  ),
                ),
              ),
              Text(
                'Hola Pedro, esta es tu progreso',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.white,
                ),
              ),
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: 45.0,
                      right: 15.0,
                      bottom: 15.0,
                      top: 8.0,
                    ),
                    padding: EdgeInsets.only(
                        right: 20.0, left: 40.0, top: 10.0, bottom: 10.0),
                    decoration: BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10.0,
                          //que tanto quiere que se extienda
                          spreadRadius: 2.0,
                          //posicion de la sombra
                          offset: Offset(2.0, 10.0),
                        )
                      ],
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(15.0),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromRGBO(83, 105, 118, 0.8),
                          Color.fromRGBO(41, 46, 73, 0.6),
                        ],
                      ),
                    ),
                    width: double.infinity,
                    //height: 400,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Medidas corporales',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Text(
                          'Estas son tus medidas y son el reflejo fiel de tu esfuerzo, oberva los logros y resultados obtenidos.',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              children: [
                                _circleProgress('1', 'Cuello'),
                                SizedBox(
                                  height: 5.0,
                                ),
                                _circleProgress('1', 'Cuello'),
                                SizedBox(
                                  height: 5.0,
                                ),
                                _circleProgress('1', 'Cuello'),
                                SizedBox(
                                  height: 5.0,
                                ),
                                _circleProgress('1', 'Cuello'),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 40.0, left: 10.0),
                              child: Column(
                                children: [
                                  _circleProgress('1', 'Cuello'),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  _circleProgress('1', 'Cuello'),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  _circleProgress('1', 'Cuello'),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  _circleProgress('1', 'Cuello'),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: -25.0,
                    child: Container(
                        margin: EdgeInsets.only(top: 12.0),
                        //alignment: Alignment.bottomLeft,
                        //decoration: BoxDecoration(color: Colors.red),
                        width: 150,
                        height: 400,
                        child: Image(
                          image: AssetImage("assets/bodyMan.png"),
                          fit: BoxFit.cover,
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _circleProgress(String text1, String text2) {
    return CircleAvatar(
      minRadius: 32.0,
      backgroundColor: Color.fromRGBO(173, 251, 223, 1.0),
      child: CircleAvatar(
        minRadius: 25.0,
        backgroundColor: Color.fromRGBO(86, 164, 181, 1.0),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          direction: Axis.vertical,
          spacing: -8,
          children: [
            Text(
              text1,
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.white,
              ),
            ),
            Text(
              text2,
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
