import 'package:flutter/material.dart';
import 'package:gym_firebase/src/bloc/provider.dart';
import 'package:gym_firebase/src/models/user_model.dart';

class ProgresoPage extends StatelessWidget {
  final containerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.userBloc(context);

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

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
        child: StreamBuilder(
          stream: userBloc.userStream,
          builder: (BuildContext context, AsyncSnapshot<UserModel> snapshot) {
            if (snapshot.hasData) {
              final usuario = snapshot.data!;

              return SingleChildScrollView(
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
                        top: (screenHeight > 760) ? screenHeight * 0.0313 : 5.0,
                        bottom: 8.0,
                      ),
                      //padding: EdgeInsets.only(top: 10.0),
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(screenWidth * 0.1364),
                        child: FadeInImage(
                          placeholder: AssetImage('assets/jar-loading.gif'),
                          image: NetworkImage(usuario.fotoUrl),
                          fadeOutDuration: Duration(milliseconds: 200),
                          height: screenWidth * 0.2727,
                          width: screenWidth * 0.2727,
                          fit: BoxFit.cover,
                        ),
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 2.0,
                        ),
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Hola ${_nombre(usuario.nombre)}, este es tu progreso',
                      style: TextStyle(
                        fontSize: screenWidth * 0.0424,
                        color: Colors.white,
                      ),
                    ),
                    _medidasCorporales(usuario, screenWidth, screenHeight),
                  ],
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  String _nombre(String nombre) {
    List<String> nombres = nombre.split(' ');

    return nombres[0];
  }

  Widget _medidasCorporales(
      UserModel usuario, double screenWidth, double screenHeight) {
    return Stack(
      children: [
        Container(
          key: containerKey,
          //height: screenHeight * 0.5,
          margin: EdgeInsets.only(
            left: screenHeight * 0.08,
            right: 25.0,
            bottom: 15.0,
            top: 8.0,
          ),
          padding:
              EdgeInsets.only(right: 20.0, left: 40.0, top: 10.0, bottom: 10.0),
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
            //color: Colors.yellow,
            borderRadius: BorderRadius.circular(15.0),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [
                (usuario.sexo == 'Masculino')
                    ? Color.fromRGBO(83, 105, 118, 0.8)
                    : Color.fromRGBO(255, 184, 211, 1.0),
                (usuario.sexo == 'Masculino')
                    ? Color.fromRGBO(41, 46, 73, 0.6)
                    : Color.fromRGBO(239, 98, 159, 1.0),
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
                  fontSize: screenWidth * 0.0485,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 6.0,
              ),
              Text(
                'Estas son tus medidas y son el reflejo fiel de tu esfuerzo, oberva los logros y resultados obtenidos.',
                style: TextStyle(
                  fontSize: screenWidth * 0.0364,
                  color: Colors.white,
                ),
                textAlign: TextAlign.right,
              ),
              SizedBox(
                height: screenHeight * 0.0133,
              ),
              (usuario.sexo == 'Masculino')
                  ? _medidasHombre(screenWidth)
                  : _medidasMujer(screenWidth),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
        (usuario.sexo == 'Masculino')
            ? _img("assets/bodyMan.png", /*screenHeight,*/ screenWidth)
            : _img("assets/bodyWoman.png", /*screenHeight,*/ screenWidth),
      ],
    );
  }

  //sin lateral recortado
  /*Widget _img(String imagen, double screenHeight) {
    return Positioned(
      left: -25.0,
      child: Container(
          margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
          //alignment: Alignment.bottomLeft,
          //decoration: BoxDecoration(color: Colors.red),
          //width: 150,
          height: screenHeight * 0.5984,
          child: Image(
            image: AssetImage(imagen),
            fit: BoxFit.cover,
          )),
    );
  }*/

  //img lateral recortado
  Widget _img(String imagen, /*double screenHeight, */ double screenWidth) {
    return Container(
        margin: EdgeInsets.only(top: 25.0, bottom: 25.0),
        //alignment: Alignment.bottomLeft,
        //decoration: BoxDecoration(color: Colors.red),
        //width: 150,
        height: screenWidth * 1.28,
        child: Image(
          image: AssetImage(imagen),
          fit: BoxFit.cover,
        ));
  }

  double sizeContainer() {
    final keyContext = containerKey.currentContext;
    final box = keyContext!.findRenderObject() as RenderBox;
    print(box.size.height);
    return box.size.height;
  }

  Widget _medidasMujer(double screenWidth) {
    Color fuera = Color.fromRGBO(244, 214, 255, 0.8);
    Color dentro = Color.fromRGBO(237, 138, 227, 1.0);

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          children: [
            _circleProgress(
              '1',
              'Cuello',
              fuera,
              dentro,
              screenWidth,
            ),
            SizedBox(
              height: screenWidth * 0.0242,
            ),
            _circleProgress(
              '3',
              'Busto',
              fuera,
              dentro,
              screenWidth,
            ),
            SizedBox(
              height: screenWidth * 0.0242,
            ),
            _circleProgress(
              '5',
              'Cintura',
              fuera,
              dentro,
              screenWidth,
            ),
            SizedBox(
              height: screenWidth * 0.0242,
            ),
            _circleProgress(
              '7',
              'Cadera',
              fuera,
              dentro,
              screenWidth,
            ),
            SizedBox(
              height: screenWidth * 0.0242,
            ),
            _circleProgress(
              '9',
              'Gemelos',
              fuera,
              dentro,
              screenWidth,
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.only(top: 40.0, left: 10.0),
          child: Column(
            children: [
              _circleProgress(
                '2',
                'Hombro',
                fuera,
                dentro,
                screenWidth,
              ),
              SizedBox(
                height: screenWidth * 0.0242,
              ),
              _circleProgress(
                '4',
                'Biceps',
                fuera,
                dentro,
                screenWidth,
              ),
              SizedBox(
                height: screenWidth * 0.0242,
              ),
              _circleProgress(
                '6',
                'Brazo',
                fuera,
                dentro,
                screenWidth,
              ),
              SizedBox(
                height: screenWidth * 0.0242,
              ),
              _circleProgress(
                '8',
                'Muslo',
                fuera,
                dentro,
                screenWidth,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _medidasHombre(double screenWidth) {
    Color fuera = Color.fromRGBO(173, 251, 223, 1.0);
    Color dentro = Color.fromRGBO(86, 164, 181, 1.0);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          children: [
            _circleProgress(
              '1',
              'Cuello',
              fuera,
              dentro,
              screenWidth,
            ),
            SizedBox(
              height: screenWidth * 0.0242,
            ),
            _circleProgress(
              '3',
              'Pecho',
              fuera,
              dentro,
              screenWidth,
            ),
            SizedBox(
              height: screenWidth * 0.0242,
            ),
            _circleProgress(
              '5',
              'Cintura',
              fuera,
              dentro,
              screenWidth,
            ),
            SizedBox(
              height: screenWidth * 0.0242,
            ),
            _circleProgress(
              '7',
              'Muslo',
              fuera,
              dentro,
              screenWidth,
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.only(top: 40.0, left: 10.0),
          child: Column(
            children: [
              _circleProgress(
                '2',
                'Hombro',
                fuera,
                dentro,
                screenWidth,
              ),
              SizedBox(
                height: screenWidth * 0.0242,
              ),
              _circleProgress(
                '4',
                'Biceps',
                fuera,
                dentro,
                screenWidth,
              ),
              SizedBox(
                height: screenWidth * 0.0242,
              ),
              _circleProgress(
                '6',
                'Brazo',
                fuera,
                dentro,
                screenWidth,
              ),
              SizedBox(
                height: screenWidth * 0.0242,
              ),
              _circleProgress(
                '8',
                'Gemelos',
                fuera,
                dentro,
                screenWidth,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _circleProgress(String text1, String text2, Color fuera, Color dentro,
      double screenWidth) {
    return CircleAvatar(
      minRadius: screenWidth * 0.1,
      backgroundColor: fuera,
      child: CircleAvatar(
        minRadius: screenWidth * 0.0818,
        backgroundColor: dentro,
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          direction: Axis.vertical,
          spacing: -8,
          children: [
            Text(
              text1,
              style: TextStyle(
                fontSize: screenWidth * 0.0364,
                color: Colors.white,
              ),
            ),
            Text(
              text2,
              style: TextStyle(
                fontSize: screenWidth * 0.0364,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
