import 'package:flutter/material.dart';

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:gym_firebase/src/bloc/provider.dart';
import 'package:gym_firebase/src/models/nutricion_model.dart';
import 'package:gym_firebase/src/providers/nutricion_provider.dart';
import 'package:gym_firebase/src/utils/search_delegate.dart';

class NutricionPage extends StatefulWidget {
  @override
  _NutricionPageState createState() => _NutricionPageState();
}

class _NutricionPageState extends State<NutricionPage> {
  final nutricionProvider = new NutricionProvider();

  final nombreController = TextEditingController();
  final idealController = TextEditingController();
  final ingreController = TextEditingController();
  final instController = TextEditingController();
  final nutriController = TextEditingController();
  final tipoController = TextEditingController();

  late double screenWidth;
  late double screenHeight;
  late double xscreen;

  late List<ComidaModel> comidas;

  String? _tipo = 'Ensaladas';

  @override
  void dispose() {
    super.dispose();
    nombreController.dispose();
    idealController.dispose();
    ingreController.dispose();
    instController.dispose();
    nutriController.dispose();
    tipoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.userBloc(context);

    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    xscreen = screenHeight - 640;

    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          Container(
            margin: EdgeInsets.only(right: 2.0),
            child: IconButton(
              onPressed: (userBloc.user.tipo == 'admin')
                  ? () => _crearComida(context)
                  : () {},
              icon: Icon(Icons.add),
              splashRadius: (userBloc.user.tipo == 'admin') ? 20.0 : 0.01,
              color: (userBloc.user.tipo == 'admin')
                  ? Colors.white
                  : Colors.transparent,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: DataSearch(comidas),
                  //enviar texto al search
                  //query: 'hola',
                );
              },
              icon: Icon(Icons.search),
              splashRadius: 20.0,
            ),
          ),
        ],
        title: Text(
          'Nutrición',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: FutureBuilder(
        future: nutricionProvider.cargarComida(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            comidas = snapshot.data;

            return SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 31),
                    child: Text(
                      'Para mejores resultados incorpora lo mejores nutrientes a tu cuerpo',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        height: 1,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  DefaultTabController(
                    length: 6,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          child: ButtonsTabBar(
                            radius: 20,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 30),
                            unselectedBackgroundColor: Colors.transparent,
                            unselectedBorderColor: Colors.white,
                            borderWidth: 1,
                            borderColor: Colors.white,
                            center: false,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: <Color>[
                                  Color.fromRGBO(0, 176, 155, 1),
                                  Color.fromRGBO(150, 201, 61, 1),
                                ],
                              ),
                            ),
                            unselectedLabelStyle:
                                TextStyle(color: Colors.white),
                            labelStyle: TextStyle(color: Colors.white),
                            //height: 20,
                            tabs: [
                              Tab(text: "Todas"),
                              Tab(text: "Ensaladas"),
                              Tab(text: "Batidos"),
                              Tab(text: "Proteinas"),
                              Tab(text: "Vitaminas"),
                              Tab(text: "Compras"),
                            ],
                          ),
                        ),
                        Container(
                          //color: Colors.red,
                          height: screenHeight * _xScreenSize(),
                          //width: double.infinity,
                          child: TabBarView(
                            children: [
                              _all(),
                              _one("Ensaladas"),
                              _one("Batidos"),
                              _one("Proteinas"),
                              _one("Vitaminas"),
                              _one("Compras"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
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
    );
  }

  double _xScreenSize() {
    double x = 0.6984;
    double w = xscreen / 20;
    int a = w.truncate();
    for (int i = 0; i < a; i++) {
      x = x + 0.005;
    }
    //print(x);
    return x;
  }

  Widget opc() {
    return StatefulBuilder(builder: (context, setState) {
      return DropdownButton<String>(
        value: _tipo,
        isExpanded: true,
        items: <String>[
          'Ensaladas',
          'Batidos',
          'Proteinas',
          'Vitaminas',
          'Compras'
        ].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (value) {
          _tipo = value;
          print(_tipo);
          setState(() {});
        },
      );
    });
  }

  void _crearComida(BuildContext context) {
    //String ingresado = '';
    showDialog(
      context: context,
      //true -> cierra el dialog al dar clic fuera de el
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          insetPadding: EdgeInsets.all(25),
          //borde redondiado
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text(
            "Crear Receta",
            //centrar texto
            textAlign: TextAlign.center,
          ),
          content: SingleChildScrollView(
            child: Column(
              //tamaño de la columna max -> maximo, min -> se adapta altamaño del contenido que tenga dentro
              mainAxisSize: MainAxisSize.min,
              children: [
                opc(),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Nombre',
                  ),
                  controller: nombreController,
                ),
                TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    labelText: 'Ideal',
                  ),
                  controller: idealController,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Nutricion',
                  ),
                  controller: nutriController,
                ),
                TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    labelText: 'Ingredientes',
                  ),
                  controller: ingreController,
                ),
                TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    labelText: 'Instrucciones',
                  ),
                  controller: instController,
                ),
                /*TextField(
                  decoration: InputDecoration(
                    labelText: 'Tipo',
                  ),
                  controller: tipoController,
                ),*/
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text("Cancelar"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text("Guardar"),
              onPressed: () {
                ComidaModel comida = new ComidaModel(
                  nombre: nombreController.text,
                  ideal: idealController.text,
                  urlFoto:
                      'https://firebasestorage.googleapis.com/v0/b/flutter-app-8f08b.appspot.com/o/noticias%2Fno_image.jpg?alt=media&token=3e9fc267-e26d-446d-be14-683486b7b51f',
                  nutricion: nutriController.text.split(" "),
                  ingredientes: ingreController.text.split("\n"),
                  instrucciones: instController.text.split("\n"),
                  tipo: _tipo as String,
                );

                nutricionProvider.crearComida(comida);
                setState(() {});
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget container(ComidaModel comida) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25.0),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, 'detalle', arguments: comida),
        child: Container(
          margin: EdgeInsets.only(bottom: 8.0),
          width: screenWidth,
          height: screenHeight * 0.375,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                child: img(comida.urlFoto),
                width: screenWidth,
                height: screenHeight * 0.375,
              ),
              Positioned(
                child: Container(
                  padding: EdgeInsets.all(5.0),
                  width: screenWidth,
                  //height: 10.0,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.8),
                  ),
                  child: Center(
                      child: Text(
                    comida.nombre.toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ),
                bottom: 0.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _one(String tipo) {
    List<Widget> containers = [];

    comidas.forEach((element) {
      if (tipo == element.tipo) {
        containers.add(container(element));
      }
    });

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Column(
          children: containers,
        ),
      ),
    );
  }

  Widget _izquierda(ComidaModel comida) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, 'detalle', arguments: comida),
      child: Container(
        margin: EdgeInsets.only(bottom: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          //color: Colors.red,
        ),
        width: screenWidth * 0.475,
        height: screenHeight * 0.3698,
        child: img(comida.urlFoto),
      ),
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

  Widget _derecha(ComidaModel comida) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, 'detalle', arguments: comida),
      child: Container(
        margin: EdgeInsets.only(bottom: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          //color: Colors.black,
        ),
        width: screenWidth * 0.4444,
        height: screenHeight * 0.2619,
        child: img(comida.urlFoto),
      ),
    );
  }

  Widget _all() {
    int i = 0;
    List<Widget> derecha = [];
    List<Widget> izquierda = [];

    comidas.forEach((element) {
      if (i % 2 == 0) {
        //print('izquierda = ${element.nombre}');
        izquierda.add(_derecha(element));
        i++;
      } else {
        //print('derecha = ${element.nombre}');
        derecha.add(_izquierda(element));
        i++;
      }
    });

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: izquierda,
            ),
            Column(
              children: derecha,
            ),
          ],
        ),
      ),
    );
  }
}
