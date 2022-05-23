import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gym_firebase/src/bloc/provider.dart';
import 'package:gym_firebase/src/models/user_model.dart';
import 'package:gym_firebase/src/providers/user_provider.dart';

class ProgresoPage extends StatelessWidget {
  final containerKey = GlobalKey();

  final UserProvider userProvider = new UserProvider();

  final List<TextEditingController> _inputsControllers = [];

  final List<String> mediciones = [];

  final formKey = GlobalKey<FormState>();

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
      appBar: AppBar(
        title: Text('Mi Progreso'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          ElevatedButton(
            onPressed: () => _ingresarAsistencia(context, userBloc),
            child: Icon(
              Icons.post_add_outlined,
              size: 35.0,
            ),
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              padding: EdgeInsets.all(10),
              primary: Colors.transparent,
              elevation: 0.0,
            ),
          ),
        ],
      ),
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
                    /*Container(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text(
                        'Mi Progreso',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),*/
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
                          imageErrorBuilder: (context, exception, stackTrace) {
                            print('Error Handler');
                            return Container(
                              height: screenWidth * 0.2627,
                              width: screenWidth * 0.2627,
                              child: Image.asset(
                                'assets/no-image.png',
                                fit: BoxFit.cover,
                              ),
                            );
                          },
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

  void _inputs() {
    for (int i = 0; i < 9; i++) {
      _inputsControllers.add(new TextEditingController());
    }
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

  Widget input(String text, int i) {
    return TextFormField(
      controller: _inputsControllers[i],
      style: TextStyle(color: Colors.white),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      /*inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
      ],*/
      onSaved: (value) {
        //tiempo = value!;
        mediciones.add(value!);
      },
      validator: (value) {
        if (value == null || value.trim() == "") return "";
        return null;
      },
      decoration: InputDecoration(
        //para que se aplica el contentpadding
        isDense: true,
        contentPadding:
            EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0, right: 5.0),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1.0),
          borderRadius: BorderRadius.circular(30.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1.0),
          borderRadius: BorderRadius.circular(30.0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(width: 1.0, color: Colors.white),
        ),
        hintText: text,
        hintStyle: TextStyle(color: Colors.white),
      ),
    );
  }

  void _ingresarAsistencia(BuildContext context, UserBloc userBloc) {
    _inputs();
    //String ingresado = '';
    showDialog(
      context: context,
      //true -> cierra el dialog al dar clic fuera de el
      barrierDismissible: false,
      builder: (context) {
        return Form(
          key: formKey,
          child: AlertDialog(
            insetPadding: EdgeInsets.all(15),
            //borde redondiado
            backgroundColor: Color.fromRGBO(72, 83, 101, 0.95),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            title: Text(
              "Medición Corporal",
              //centrar texto
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
            content: SingleChildScrollView(
              child: Column(
                //tamaño de la columna max -> maximo, min -> se adapta altamaño del contenido que tenga dentro
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Ingresa en este formulario tus mediciones mensuales en centimetros.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: input("Cuello", 0),
                      ),
                      SizedBox(width: 25.0),
                      Flexible(
                        child: input("Hombros", 1),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: input(
                            (userBloc.user.sexo == 'Femenino')
                                ? "Busto"
                                : "Pecho",
                            2),
                      ),
                      SizedBox(width: 25.0),
                      Flexible(
                        child: input("Biceps", 3),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: input("Cintura", 4),
                      ),
                      SizedBox(width: 25.0),
                      Flexible(
                        child: input("Brazo", 5),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: input("Muslo", 6),
                      ),
                      SizedBox(width: 25.0),
                      Flexible(
                        child: input("Gemelos", 7),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  (userBloc.user.sexo == 'Femenino')
                      ? Row(
                          children: [
                            Flexible(
                              child: input("Cadera", 8),
                            ),
                          ],
                        )
                      : SizedBox(
                          height: 10.0,
                        ),
                  SizedBox(
                    height: 5.0,
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                child: Text(
                  "Cancelar",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              TextButton(
                child: Text(
                  "Guardar",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  if (!formKey.currentState!.validate()) return;
                  formKey.currentState!.save();
                  /*var date = fecha.split('-');
                  //print(tiempo);
                  usuario.asistencia!
                      .add(usuario.asisten(date[2], date[1], date[0], tiempo));

                  if (usuario.asistencia!.elementAt(0).year == "2001") {
                    usuario.asistencia!.removeAt(0);
                  }*/

                  //print(usuario.asistencia!.last.year);
                  //userProvider.editarUsuario(usuario);
                  //print();

                  /*_inputsControllers[0].text = "";
                  _inputsControllers[0].text = "";*/

                  DateTime date = DateTime.now();

                  Medidas medida = new Medidas();
                  medida.dia = '${date.day}';
                  medida.mes = '${date.month}';
                  medida.year = '${date.year}';
                  if (userBloc.user.sexo == 'Femenino') {
                    /*for (int i = 0; i < 9; i++) {
                      print(mediciones[i]);
                    }*/
                    medida.cuello = mediciones[0];
                    medida.hombros = mediciones[1];
                    medida.pecho = mediciones[2]; //pecho = busto
                    medida.biceps = mediciones[3];
                    medida.cintura = mediciones[4];
                    medida.brazo = mediciones[5];
                    medida.cadera = mediciones[8]; //el hombre no tiene cadera
                    medida.muslo = mediciones[6];
                    medida.gemelo = mediciones[7];
                  } else {
                    /*for (int i = 0; i < 8; i++) {
                      print(mediciones[i]);
                    }*/
                    medida.cuello = mediciones[0];
                    medida.hombros = mediciones[1];
                    medida.pecho = mediciones[2]; //pecho = busto
                    medida.biceps = mediciones[3];
                    medida.cintura = mediciones[4];
                    medida.brazo = mediciones[5];
                    //medida.cadera = mediciones[8]; //el hombre no tiene cadera
                    medida.muslo = mediciones[6];
                    medida.gemelo = mediciones[7];
                  }

                  userBloc.user.medidas!.add(medida);

                  userProvider.editarUsuario(userBloc.user);

                  for (int i = 0; i < 9; i++) {
                    _inputsControllers[i].text = "";
                  }

                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
