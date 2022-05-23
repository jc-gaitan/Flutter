import 'package:flutter/material.dart';
import 'dart:async';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  //siver para controlar el scroll
  ScrollController _scrollController = new ScrollController();

  List<int> _listaNumero = [];
  int _ultimoItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _agregar10();

    _scrollController.addListener(() {
      //si la posicion actual es igual al maximo
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        //_agregar10();
        _fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    //toca eliminar el scrollController cuando se cierrar la ventana, para prevenir fugas de memoria.
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listas y Scroll"),
      ),
      body: Stack(
        children: [
          _crearLista(),
          _crearLoading(),
        ],
      ),
    );
  }

  Widget _crearLoading() {
    if (_isLoading) {
      //circulo de carga --> cuando esta cargando la aplicacion
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end, //para que se ponga abajo
        children: [
          Center(
            child: CircularProgressIndicator(),
          ),
          SizedBox(height: 15.0),
        ],
      );
    } else {
      return Container();
    }
  }

  Widget _crearLista() {
    //RefreshIndicator -> para cuando esta en la parte de arriba de la lista y le de abajar, recarga la pagina
    return RefreshIndicator(
      onRefresh: _recargarPagina,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumero.length,
        itemBuilder: (BuildContext context, int index) {
          final image = _listaNumero[index];

          return FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage('https://picsum.photos/500/300/?image=$image'),
          );
        },
      ),
    );
  }

  Future _recargarPagina() async {
    final _duration = new Duration(seconds: 2);
    new Timer(_duration, () {
      _listaNumero.clear(); //eliminar la lista de numeros
      _ultimoItem++;
      _agregar10();
    });

    return Future.delayed(_duration);
  }

  Future _fetchData() async {
    _isLoading = true;

    setState(() {});

    final _duration = new Duration(seconds: 2);
    return new Timer(_duration, respuestaHTTP);
  }

  void respuestaHTTP() {
    _isLoading = false;
    _agregar10();
    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 250),
    );
  }

  void _agregar10() {
    for (var i = 0; i < 10; i++) {
      _ultimoItem++;
      _listaNumero.add(_ultimoItem);
    }

    setState(() {});
  }
}
