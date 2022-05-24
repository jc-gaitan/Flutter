import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gym_firebase/src/charts/calendar_chart.dart';
import 'package:gym_firebase/src/charts/circular_chart.dart';
import 'package:gym_firebase/src/charts/column_chart.dart';

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

  @override
  void dispose() {
    super.dispose();
    //toca eliminar el scrollController cuando se cierrar la ventana, para prevenir fugas de memoria.
    tabController.dispose();
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
              return SingleChildScrollView(
                child: Column(
                  children: [
                    _datos(userBloc),
                    _asistencia(),
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
                      onPressed: () {},
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
                    'JUN 21 - 26',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    width: 25.0,
                    child: TextButton(
                      onPressed: () {},
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
        Expanded(child: columnChart()),
        _estadisticas(),
      ],
    );
  }

  Widget _estadisticas() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.0),
        Text(
          'Tiempo de trabajo',
          style: TextStyle(
            fontSize: screenWidth * 0.0485,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 5.0),
        _tiempoTrabajo('5,00', '75Mn', '30%'),
        SizedBox(
          height: 6.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _targeta2(
              Color.fromRGBO(255, 81, 47, 0.8),
              Color.fromRGBO(240, 152, 25, 0.8),
              'Total Sesiones',
              '4',
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              direction: Axis.horizontal,
              spacing: -12,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'cumplimiento:',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Container(
                  child: circularChart(),
                  height: 110.0,
                  width: 110.0,
                  //color: Colors.red,
                ),
              ],
            ),
          ],
        ),
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
                      onPressed: () {},
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
                    'JUN 21 - 26',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    width: 25.0,
                    child: TextButton(
                      onPressed: () {},
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
        Expanded(child: columnChart()),
        _estadisticas(),
      ],
    );
  }

  Widget _mes() {
    return Column(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.only(top: 10.0, right: 5.0, left: 5.0),
            child: calendar(),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
        _estadisticas(),
      ],
    );
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

  Widget _tiempoTrabajo(String t1, String t2, String porce) {
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
        _targeta2(Color.fromRGBO(47, 152, 75, 0.8),
            Color.fromRGBO(111, 176, 128, 0.8), 'Comparativo', porce),
      ],
    );
  }

  Widget _asistencia() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Asistencia al Gym:',
            style: TextStyle(
              fontSize: screenWidth * 0.0606,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 6.0,
          ),
          _tabBarAsistencia(),
          Container(
            padding: EdgeInsets.only(top: 5.0),
            height: screenHeight * 0.8,
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
        vertical: screenWidth * 0.0152,
        horizontal: screenWidth * 0.0303,
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
              fontSize: screenWidth * 0.0424,
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
                  Icons.calculate,
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
}
