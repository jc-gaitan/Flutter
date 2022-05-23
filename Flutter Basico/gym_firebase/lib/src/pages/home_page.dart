import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:week_of_year/week_of_year.dart';

import 'package:gym_firebase/src/charts/calendar_chart.dart';
//import 'package:gym_firebase/src/charts/circular_chart.dart';
import 'package:gym_firebase/src/charts/column_chart.dart';
import 'package:gym_firebase/src/charts/column_mes_chart.dart';

import 'package:image_picker/image_picker.dart';

import 'package:gym_firebase/src/bloc/provider.dart';
import 'package:gym_firebase/src/models/user_model.dart';
import 'package:gym_firebase/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:gym_firebase/src/providers/user_provider.dart';
import 'package:gym_firebase/src/widgets/input_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  //
  //
  late TabController tabController;

  final UserProvider userProvider = new UserProvider();

  final prefs = new PreferenciasUsuario();

  late UserModel usuario;

  final formKey = GlobalKey<FormState>();

  File? foto;

  bool cargo = false;

  late double screenWidth;
  late double screenHeight;

  String _fecha = "";
  TextEditingController _inputFieldDateController = new TextEditingController();
  TextEditingController _inputFieldTimeController = new TextEditingController();

  int sig1 = 0;
  int sig2 = 0;

  late String semanagrafica;
  late List<double> diasgrafica;
  late String yeartxt;
  late List<double> mesesgrafica;

  DateTime date = DateTime.now();
  DateTime datey = DateTime.now();

  late double totalH;
  late double promH;
  late int totalSesion;

  late double totalHy;
  late double promHy;
  late int totalSesiony;

  late double totalHm;
  late double promHm;
  late int totalSesionm;

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
    _inputFieldDateController.dispose();
    _inputFieldTimeController.dispose();
  }

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.userBloc(context);

    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      //appbar transparente
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      //para que el contenido no se cambie cuando el teclado sale
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: () => _cerrarSesion(),
              icon: Icon(Icons.logout),
              splashRadius: 20.0,
            ),
          )
        ],
        title: Text(
          'Mi Actividad',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: StreamBuilder(
          stream: userBloc.userStream,
          builder: (BuildContext context, AsyncSnapshot<UserModel> snapshot) {
            if (snapshot.hasData) {
              usuario = snapshot.data!;

              semanagrafica = semanaGrafica(date);
              diasgrafica = diasGrafica(date);

              yeartxt = yearTxt(date);
              mesesgrafica = mesesGrafica(datey);

              return SingleChildScrollView(
                child: Column(
                  children: [
                    _datos(userBloc),
                    _asistencia(userBloc),
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

  Widget _tabBarAsistencia() {
    return TabBar(
      indicatorColor: Color.fromRGBO(187, 83, 223, 0.8),
      tabs: [
        Tab(
          child: Text(
            'Semana',
            style: TextStyle(fontSize: screenWidth * 0.0424),
          ),
          //text: 'Semana',
        ),
        Tab(
          child: Text(
            'Mes',
            style: TextStyle(fontSize: screenWidth * 0.0424),
          ),
          //text: 'Mes',
        ),
        Tab(
          child: Text(
            'Año',
            style: TextStyle(fontSize: screenWidth * 0.0424),
          ),
          //text: 'Año',
        ),
      ],
      controller: this.tabController,
    );
  }

  Widget _semana() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Text(
                'Minutos',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 7.0),
            ),
            Container(
              child: Row(
                children: [
                  SizedBox(
                    width: 25.0,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          sig1++;
                          //print('date = $date');
                          date = date.subtract(Duration(days: 7));
                          semanagrafica = semanaGrafica(date);
                          diasgrafica = diasGrafica(date);
                          //print(date);
                          //print(semanagrafica);
                        });
                      },
                      child: Text(
                        '<',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Semana ' + semanagrafica,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    width: 25.0,
                    child: TextButton(
                      onPressed: (sig1 == 0)
                          ? null
                          : () {
                              setState(() {
                                sig1--;
                                date = date.add(Duration(days: 7));
                                semanagrafica = semanaGrafica(date);
                                diasgrafica = diasGrafica(date);
                                //print(date);
                                //print(semanagrafica);
                              });
                            },
                      child: Text(
                        '>',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 7.0),
            ),
          ],
        ),
        Expanded(child: columnChart(diasgrafica)),
        _estadisticas('$totalH', '$promH Mn', '30%', '$totalSesion', ""),
      ],
    );
  }

  String semanaGrafica(DateTime date) {
    return date.weekOfYear.toString();
  }

  List<double> diasGrafica(DateTime date) {
    totalH = 0;
    promH = 0;
    totalSesion = 0;

    int sizeList = usuario.asistencia!.length;
    String diaG = usuario.asistencia!.elementAt(0).dia;
    List<double> minutos;
    minutos = [0, 0, 0, 0, 0, 0, 0];
    if (sizeList > 0 && diaG != "") {
      int x = date.weekday;
      DateTime aux = date.subtract(Duration(days: x - 1));
      this.date = aux;
      //print('aux $aux');
      for (int i = 0; i < 7; i++) {
        usuario.asistencia!.forEach((element) {
          String fec = element.year + "-" + element.mes + "-" + element.dia;
          //print(fec);
          DateTime fecha = DateTime.parse(fec);
          var fechaG = "${fecha.day}-${fecha.month}-${fecha.year}";
          var fechaAx = "${aux.day}-${aux.month}-${aux.year}";
          //print(fechaG);
          //print(fechaAx);

          if (fechaG == fechaAx) {
            minutos[i] = double.parse(element.minutos.toString());
            totalH = totalH + double.parse(element.minutos.toString());
            totalSesion++;
          }
        });

        aux = aux.add(Duration(days: 1));
      }
    }

    double auxProm = totalH;

    totalH = totalH / 60;
    //limitar a dos decimales
    totalH = double.parse((totalH).toStringAsFixed(2));

    promH = (totalSesion == 0) ? 0 : auxProm / totalSesion;
    //limitar a dos decimales
    promH = double.parse((promH).toStringAsFixed(2));

    /*print(totalSesion);
    print(promH);
    print(totalH);*/

    return minutos;
  }

  Widget _estadisticas(
    String totalH,
    String promH,
    String porcentaje,
    String totalSesion,
    String nameMes,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.0),
        Text(
          'Tiempo de trabajo $nameMes',
          style: TextStyle(
            fontSize: screenWidth * 0.0485,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 5.0),
        _tiempoTrabajo(totalH, promH, porcentaje, totalSesion),
        SizedBox(
          height: 10.0,
        ),
      ],
    );
  }

  Widget _year() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Text(
                'Horas',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 7.0),
            ),
            Container(
              child: Row(
                children: [
                  SizedBox(
                    width: 25.0,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          sig2++;
                          datey = datey.subtract(Duration(days: 365));
                          yeartxt = yearTxt(datey);
                          mesesgrafica = mesesGrafica(datey);
                          //print('fecha < $datey');
                          //print(datey.year);
                        });
                      }, //() {}
                      child: Text(
                        '<',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    '${datey.year}',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    width: 25.0,
                    child: TextButton(
                      onPressed: (sig2 == 0)
                          ? null
                          : () {
                              setState(() {
                                sig2--;
                                datey = datey.add(Duration(days: 365));
                                //print('fecha > $datey');
                                yeartxt = yearTxt(datey);
                                //print(yeartxt);
                                mesesgrafica = mesesGrafica(datey);
                              });
                            }, //() {}
                      child: Text(
                        '>',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 7.0),
            ),
          ],
        ),
        Expanded(child: columnChartMes(mesesgrafica)),
        _estadisticas('$totalHy', '$promHy Mn', '30%', '$totalSesiony', ""),
      ],
    );
  }

  String yearTxt(DateTime date) {
    int w = date.year;
    //print('w = $w');
    String text = '$w';
    return text;
  }

  List<double> mesesGrafica(DateTime date) {
    totalHy = 0;
    promHy = 0;
    totalSesiony = 0;

    int sizeList = usuario.asistencia!.length;
    String diaG = usuario.asistencia!.elementAt(0).dia;

    List<double> minutos = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

    //DateTime date = DateTime.now();
    String x = '${date.year}';
    //print(x);

    if (sizeList > 0 && diaG != "") {
      //String fechaNow = '$date.year - $date.mes';
      usuario.asistencia!.forEach((element) {
        String yearAsis = element.year;
        int mes = int.parse(element.mes);
        //print(mes);

        if (x == yearAsis) {
          double tiempo = double.parse(element.minutos.toString()) / 60;

          minutos[mes - 1] = minutos[mes - 1] + tiempo;

          totalHy = totalHy + double.parse(element.minutos.toString());
          totalSesiony++;
        }
      });
    }

    double auxPromy = totalHy;

    totalHy = totalHy / 60;
    //limitar a dos decimales
    totalHy = double.parse((totalHy).toStringAsFixed(2));

    promHy = (totalSesiony == 0) ? 0 : auxPromy / totalSesiony;
    //limitar a dos decimales
    promHy = double.parse((promHy).toStringAsFixed(2));

    /*print(totalSesiony);
    print(totalHy);
    print(promHy);*/

    return minutos;
  }

  Widget _mes() {
    return Column(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.only(top: 10.0, right: 5.0, left: 5.0),
            child: calendar(diasAsistidos()),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        ),
        _estadisticas('$totalHm', '$promHm Mn', '30%', '$totalSesionm',
            "de " + obtenerNameMes()),
      ],
    );
  }

  String obtenerNameMes() {
    DateTime date = DateTime.now();
    switch (date.month) {
      case 1:
        return "Enero";
      case 2:
        return "Febrero";
      case 3:
        return "Marzon";
      case 4:
        return "Abril";
      case 5:
        return "Mayo";
      case 6:
        return "Junio";
      case 7:
        return "Julio";
      case 8:
        return "Agosto";
      case 9:
        return "Septiembre";
      case 10:
        return "Octubre";
      case 11:
        return "Noviembre";
      case 12:
        return "Diciembre";
      default:
        return "";
    }
  }

  List<DateTime> diasAsistidos() {
    totalHm = 0;
    promHm = 0;
    totalSesionm = 0;

    var fecha = usuario.asistencia!.elementAt(0);

    DateTime date = DateTime.now();

    List<DateTime> dias = [];
    if (fecha.dia == "") {
      DateTime fecha = DateTime.parse("2010-10-10");
      dias.add(fecha);
    } else {
      usuario.asistencia!.forEach((element) {
        String fec = element.year + "-" + element.mes + "-" + element.dia;
        DateTime fecha = DateTime.parse(fec);
        dias.add(fecha);

        if (date.year == fecha.year && date.month == fecha.month) {
          double minutos = double.parse(element.minutos);
          totalHm = totalHm + minutos;
          totalSesionm++;
        }
      });
    }

    double auxProm = totalHm;

    totalHm = totalHm / 60;
    //limitar a dos decimales
    totalHm = double.parse((totalHm).toStringAsFixed(2));

    promHm = (totalSesionm == 0) ? 0 : auxProm / totalSesionm;
    //limitar a dos decimales
    promHm = double.parse((promHm).toStringAsFixed(2));

    /*print(auxProm);
    print(totalH);
    print(promH);
    print(totalSesion);*/

    //print(dias);

    return dias;
  }

  Widget _tabView() {
    return TabBarView(
      controller: tabController,
      children: <Widget>[
        //hacer las graficas
        _semana(),
        _mes(),
        _year(),
      ],
    );
  }

  Widget _tiempoTrabajo(
      String t1, String t2, String porce, String totalSesion) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _targeta2(Color.fromRGBO(20, 30, 48, 0.8),
            Color.fromRGBO(36, 59, 85, 0.8), 'Total Horas', t1),
        SizedBox(
          width: screenWidth * 0.0152,
        ),
        _targeta2(Color.fromRGBO(20, 30, 48, 0.8),
            Color.fromRGBO(36, 59, 85, 0.8), 'Prom. Sesión', t2),
        SizedBox(
          width: screenWidth * 0.0152,
        ),
        /*_targeta2(Color.fromRGBO(47, 152, 75, 0.8),
            Color.fromRGBO(111, 176, 128, 0.8), 'Comparativo', porce),*/
        //
        _targeta2(
          Color.fromRGBO(255, 81, 47, 0.8),
          Color.fromRGBO(240, 152, 25, 0.8),
          'Total Sesiones',
          totalSesion,
        ),
      ],
    );
  }

  Widget _asistencia(UserBloc userBloc) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Asistencia al Gym:',
                style: TextStyle(
                  fontSize: screenWidth * 0.0606,
                  color: Colors.white,
                ),
              ),
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
          SizedBox(
            height: 6.0,
          ),
          _tabBarAsistencia(),
          Container(
            padding: EdgeInsets.only(top: 5.0),
            height: screenHeight * 0.70,
            //color: Colors.white,
            child: _tabView(),
          ),
        ],
      ),
    );
  }

  Widget _targeta2(Color color1, Color color2, String text1, String text2) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: screenWidth * 0.015,
        horizontal: screenWidth * 0.025,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            color1,
            color2,
          ],
        ),
        //sombras
        /*boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            //que tanto quiere que se extienda
            spreadRadius: 2.0,
            //posicion de la sombra
            offset: Offset(2.0, 10.0),
          )
        ],*/
        //color: color,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.white70,
        ),
      ),
      child: Column(
        children: [
          Text(
            text1,
            style: TextStyle(
              fontSize: screenWidth * 0.0422,
              color: Colors.white,
            ),
          ),
          Text(
            text2,
            style: TextStyle(
              fontSize: screenWidth * 0.0606,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _estrellas() {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: Color.fromRGBO(255, 190, 0, 1.0),
          size: 15.0,
        ),
        Icon(
          Icons.star,
          color: Color.fromRGBO(255, 190, 0, 1.0),
          size: 15.0,
        ),
        Icon(
          Icons.star,
          color: Color.fromRGBO(255, 190, 0, 1.0),
          size: 15.0,
        ),
        Icon(
          Icons.star,
          color: Color.fromRGBO(255, 190, 0, 1.0),
          size: 15.0,
        ),
      ],
    );
  }

  Widget _datos(UserBloc userBloc) {
    /*final fotoPerfil = Container(
      child: CircleAvatar(
        backgroundImage: NetworkImage(usuario.fotoUrl),
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
    );*/

    final fotoPerfil = GestureDetector(
      onTap: () => cambiarFoto(),
      child: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(screenWidth * 0.1364),
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
    );

    final containerTop = Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      width: double.infinity,
      height: screenWidth * 0.3394,
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
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                //color: Colors.red,
                padding: EdgeInsets.only(left: 10.0),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  direction: Axis.vertical,
                  spacing: -8,
                  children: <Widget>[
                    Text(
                      'Puntos',
                      style: TextStyle(
                        fontSize: screenWidth * 0.0424,
                      ),
                    ),
                    Text(
                      'acumulados: ',
                      style: TextStyle(
                        fontSize: screenWidth * 0.0424,
                      ),
                    ),
                    Text(
                      usuario.puntos,
                      style: TextStyle(
                        fontSize: screenWidth * 0.097,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                //color: Colors.red,
                padding: EdgeInsets.only(right: 10.0),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  direction: Axis.vertical,
                  spacing: 0,
                  children: <Widget>[
                    Text(
                      'Membresia',
                      style: TextStyle(
                        fontSize: screenWidth * 0.0424,
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 2.0, horizontal: 15.0),
                      child: Text(
                        usuario.membresia,
                        style: TextStyle(
                          fontSize: screenWidth * 0.0424,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 190, 0, 1.0),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    _estrellas(),
                    Text(
                      usuario.puntos,
                      style: TextStyle(
                        fontSize: screenWidth * 0.0303,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
              child: Text(
            usuario.nombre,
            style: TextStyle(
              fontSize: screenWidth * 0.0485,
              fontWeight: FontWeight.bold,
            ),
          )),
        ],
      ),
    );

    final containerBottom = Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      width: double.infinity,
      height: screenWidth * 0.3394,
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
        color: Color.fromRGBO(36, 59, 85, 1.0),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _targeta('assets/iconEstatura.png', usuario.estatura, 'Estatura',
              userBloc),
          SizedBox(width: screenWidth * 0.0606),
          _targeta('assets/iconPeso.png', usuario.peso, 'Peso', userBloc),
          SizedBox(width: screenWidth * 0.0606),
          _targeta('assets/IconEdad.png', usuario.edad, 'Edad', userBloc),
        ],
      ),
    );

    final info = Container(
      padding: EdgeInsets.only(top: screenWidth * 0.1264, right: 15, left: 15),
      child: Column(
        children: [
          containerTop,
          containerBottom,
        ],
      ),
    );

    return Stack(
      children: [
        info,
        Container(
          child: fotoPerfil,
          alignment: Alignment.topCenter,
        ),
      ],
    );
  }

  Widget _targeta(String icon, String text1, String text2, UserBloc userBloc) {
    return GestureDetector(
      onTap: () => _mostrarAlert(context, text2, userBloc),
      child: Container(
        height: screenWidth * 0.2727,
        width: screenWidth * 0.2424,
        padding: EdgeInsets.only(top: screenWidth * 0.0242),
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          //sombras
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
          //color: Color.fromRGBO(255, 190, 0, 1.0),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              (usuario.sexo == 'Masculino')
                  ? Color.fromRGBO(0, 17, 167, 0.8)
                  : Color.fromRGBO(237, 138, 227, 0.8),
              Color.fromRGBO(187, 83, 223, 0.6),
            ],
          ),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Color.fromRGBO(187, 83, 223, 0.6),
          ),
        ),
        child: Column(
          children: [
            ImageIcon(
              AssetImage(icon),
              size: screenWidth * 0.0909,
              color: Colors.white,
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              direction: Axis.vertical,
              spacing: -8,
              children: <Widget>[
                Text(
                  text1,
                  style: TextStyle(
                    fontSize: screenWidth * 0.0606,
                    color: Colors.white,
                  ),
                ),
                Text(
                  text2,
                  style: TextStyle(
                    fontSize: screenWidth * 0.0303,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _mostrarAlert(BuildContext context, String text, UserBloc userBloc) {
    //String ingresado = '';
    showDialog(
      context: context,
      //true -> cierra el dialog al dar clic fuera de el
      barrierDismissible: false,
      builder: (context) {
        return Form(
          key: formKey,
          child: AlertDialog(
            //borde redondiado
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: Text(
              "Ingrese su $text",
              //centrar texto
              textAlign: TextAlign.center,
            ),
            content: Column(
              //tamaño de la columna max -> maximo, min -> se adapta altamaño del contenido que tenga dentro
              mainAxisSize: MainAxisSize.min,
              children: [
                input(
                  null,
                  text,
                  usuario,
                  Colors.black,
                  Colors.white,
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
                onPressed: () => actualizarUser(text, userBloc),
              ),
            ],
          ),
        );
      },
    );
  }

  void actualizarUser(String text, UserBloc userBloc) {
    if (!formKey.currentState!.validate()) return;

    /* Si el formulario no es valido no ejecuta las demas lineas de codigo */

    //print("Formulario valido");

    //ejecuta en onSaved de los TextFiel
    formKey.currentState!.save();

    userBloc.editarUser(usuario);

    setState(() {});

    //print(usuario.estatura);

    Navigator.of(context).pop();
  }

  void _cerrarSesion() {
    prefs.email = '';
    prefs.token = '';
    usuario = new UserModel();
    Navigator.pushReplacementNamed(context, '/');
  }

  void cambiarFoto() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: new Icon(Icons.photo),
              title: new Text('Galeria'),
              onTap: () {
                _seleccionarFoto();
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: new Icon(Icons.camera_alt),
              title: new Text('Camara'),
              onTap: () {
                _tomarFoto();
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  _seleccionarFoto() async {
    _procesarImagen(ImageSource.gallery);
  }

  _tomarFoto() async {
    _procesarImagen(ImageSource.camera);
  }

  _procesarImagen(ImageSource origen) async {
    final UserProvider userProvider = new UserProvider();

    XFile? img = await ImagePicker().pickImage(
      source: origen,
      imageQuality: 30,
    );

    if (img != null) {
      foto = new File(img.path);
    }

    if (foto != null) {
      _cargando(context);
      usuario.fotoUrl = await userProvider.subirImagen(foto!);
      //userProvider.subirImagen(foto!);
      //usuario.fotoUrl = 'none';
      cargo = true;
      foto = null;
    }

    if (usuario.id == '') {
      //productosProvider.crearProducto(producto);
    } else {
      userProvider.editarUsuario(usuario);
    }

    //mostrarSnackBar('Registro Guardado. ');

    setState(() {});
  }

  void _cargando(BuildContext context) {
    final _timer = Timer(Duration(seconds: 2), () {
      if (cargo) {
        Navigator.of(context).pop();
      }
    });
    showDialog(
      context: context,
      //true -> cierra el dialog al dar clic fuera de el
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          //borde redondiado
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          content: Column(
            //tamaño de la columna max -> maximo, min -> se adapta altamaño del contenido que tenga dentro
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Subiendo imagen",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 5.0),
              CircularProgressIndicator(),
              SizedBox(height: 5.0),
            ],
          ),
        );
      },
    ).then((val) {
      if (cargo) {
        _timer.cancel();
      }
    });
  }

  void _ingresarAsistencia(BuildContext context, UserBloc userBloc) {
    //String ingresado = '';
    String tiempo = "";
    String fecha = "";
    showDialog(
      context: context,
      //true -> cierra el dialog al dar clic fuera de el
      barrierDismissible: false,
      builder: (context) {
        return Form(
          key: formKey,
          child: AlertDialog(
            insetPadding: EdgeInsets.all(25),
            //borde redondiado
            backgroundColor: Color.fromRGBO(72, 83, 101, 0.95),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            title: Text(
              "Ingreso de Sesiones",
              //centrar texto
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
            content: Column(
              //tamaño de la columna max -> maximo, min -> se adapta altamaño del contenido que tenga dentro
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Ingresa en este formulario la fecha de la sesión y la duración en minutos.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: _inputFieldTimeController,
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  onSaved: (value) {
                    tiempo = value!;
                  },
                  validator: (value) {
                    if (value == null || value.trim() == "") return "";
                    return null;
                  },
                  decoration: InputDecoration(
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
                    hintText: 'Duración sesión',
                    hintStyle: TextStyle(color: Colors.white),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 8.0, right: 5.0),
                      child: Icon(
                        Icons.timelapse,
                        //size: 30.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: _inputFieldDateController,
                  enableInteractiveSelection: false,
                  validator: (value) {
                    if (value == null || value.trim() == "") return "";
                    return null;
                  },
                  onSaved: (value) {
                    fecha = value!;
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
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
                    hintText: 'Fecha',
                    hintStyle: TextStyle(color: Colors.white),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 8.0, right: 5.0),
                      child: Icon(
                        Icons.calendar_today_outlined,
                        //size: 30.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  onTap: () {
                    //quitar el foco
                    FocusScope.of(context).requestFocus(new FocusNode());
                    _selectDate(context);
                  },
                ),
              ],
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
                  var date = fecha.split('-');
                  //print(tiempo);
                  usuario.asistencia!
                      .add(usuario.asisten(date[2], date[1], date[0], tiempo));

                  if (usuario.asistencia!.elementAt(0).year == "2001") {
                    usuario.asistencia!.removeAt(0);
                  }

                  //print(usuario.asistencia!.last.year);
                  userProvider.editarUsuario(usuario);
                  //print();

                  _inputFieldDateController.text = "";
                  _inputFieldTimeController.text = "";

                  setState(() {});

                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime date = DateTime.now();
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2021, 01, 01),
      lastDate: new DateTime(date.year, date.month, date.day),
      locale: Locale('es'),
    );

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _fecha = _fecha.substring(0, 10);
        _inputFieldDateController.text = _fecha;
      });
    }
  }
}
