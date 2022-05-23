import 'package:custom_appbar/src/widget/input_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

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
              onPressed: () {},
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              _datos(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Asistencia al Gym:',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    TabBar(
                      indicatorColor: Color.fromRGBO(187, 83, 223, 0.8),
                      tabs: [
                        new Tab(
                          text: 'Semana',
                        ),
                        new Tab(
                          text: 'Mes',
                        ),
                        new Tab(
                          text: 'Año',
                        ),
                      ],
                      controller: this.tabController,
                    ),
                    new Container(
                      padding: EdgeInsets.only(top: 5.0),
                      height: 80.0,
                      child: new TabBarView(
                        controller: tabController,
                        children: <Widget>[
                          new Card(
                            child: new ListTile(
                              leading: const Icon(Icons.home),
                              title: new TextField(
                                decoration: const InputDecoration(
                                    hintText: 'Search for address...'),
                              ),
                            ),
                          ),
                          new Card(
                            child: new ListTile(
                              leading: const Icon(Icons.location_on),
                              title: new Text(
                                  'Latitude: 48.09342\nLongitude: 11.23403'),
                              trailing: new IconButton(
                                  icon: const Icon(Icons.my_location),
                                  onPressed: () {}),
                            ),
                          ),
                          new Card(
                            child: new ListTile(
                              leading: const Icon(Icons.location_on),
                              title: new Text(
                                  'Latitude: 48.09342\nLongitude: 11.23403'),
                              trailing: new IconButton(
                                  icon: const Icon(Icons.my_location),
                                  onPressed: () {}),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Tiempo de trabajo',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _targeta2(
                            Color.fromRGBO(20, 30, 48, 0.8),
                            Color.fromRGBO(36, 59, 85, 0.8),
                            'Total Horas',
                            '5,00'),
                        SizedBox(
                          width: 20.0,
                        ),
                        _targeta2(
                            Color.fromRGBO(20, 30, 48, 0.8),
                            Color.fromRGBO(36, 59, 85, 0.8),
                            'Prom. Sesión',
                            '75Mn'),
                        SizedBox(
                          width: 20.0,
                        ),
                        _targeta2(
                            Color.fromRGBO(47, 152, 75, 0.8),
                            Color.fromRGBO(111, 176, 128, 0.8),
                            'Comparativo',
                            '30%'),
                      ],
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    _targeta2(
                        Color.fromRGBO(255, 81, 47, 0.8),
                        Color.fromRGBO(240, 152, 25, 0.8),
                        'Total Sesiones',
                        '4'),
                    SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _targeta2(Color color1, Color color2, String text1, String text2) {
    return Container(
      padding: EdgeInsets.all(5.0),
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
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          Text(
            text2,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _datos() {
    final fotoPerfil = Container(
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
    );

    final containerTop = Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      width: double.infinity,
      height: 130.0,
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
                padding: EdgeInsets.only(left: 10.0),
                child: Column(
                  children: [
                    Text(
                      'Puntos',
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      'acumulados',
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      '40',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 10.0),
                child: Column(
                  children: [
                    Text(
                      'Membresia',
                      style: TextStyle(fontSize: 14),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 2.0, horizontal: 15.0),
                      child: Text(
                        'Premium',
                        style: TextStyle(fontSize: 14),
                      ),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 190, 0, 1.0),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    Row(
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
                    ),
                    Text(
                      '40',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
              child: Text(
            'Juan Camilo Gaitan Villegas',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          )),
        ],
      ),
    );

    final containerBottom = Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      width: double.infinity,
      height: 130,
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
          _targeta(Icons.person, '1,84m', 'Estatura'),
          SizedBox(width: 20),
          _targeta(Icons.calculate, '88Kg', 'Peso'),
          SizedBox(width: 20),
          _targeta(Icons.calendar_today, '38', 'Edad'),
        ],
      ),
    );

    final info = Container(
      padding: EdgeInsets.only(top: 40, right: 15, left: 15),
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

  Widget _targeta(IconData icon, String text1, String text2) {
    return GestureDetector(
      onTap: () => _mostrarAlert(context, text2),
      child: Container(
        height: 90,
        width: 80,
        padding: EdgeInsets.only(top: 8.0),
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
              Color.fromRGBO(0, 17, 167, 0.8),
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
            Icon(
              icon,
              size: 30,
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
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                Text(
                  text2,
                  style: TextStyle(
                    fontSize: 10,
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

  void _mostrarAlert(BuildContext context, String text) {
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
            "Ingrese su $text",
            //centrar texto
            textAlign: TextAlign.center,
          ),
          content: Column(
            //tamaño de la columna max -> maximo, min -> se adapta altamaño del contenido que tenga dentro
            mainAxisSize: MainAxisSize.min,
            children: [
              InputWidget(Icons.calculate, text),
            ],
          ),
          actions: [
            TextButton(
              child: Text("Cancelar"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text("Guardar"),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }
}
