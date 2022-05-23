import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Card Page'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          _cardTipo1(),
          SizedBox(height: 30),
          _cardTipo2(),
          SizedBox(height: 30),
          _cardTipo1(),
          SizedBox(height: 30),
          _cardTipo2(),
          SizedBox(height: 30),
          _cardTipo1(),
          SizedBox(height: 30),
          _cardTipo2(),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    final card = Container(
      //ayuda a que nada de los que este en la targeta se salga
      //clipBehavior: Clip.antiAlias,

      child: Column(
        children: [
          //cargar una imagen local miestras que termina de cargar la imagen de internet
          FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage(
                'https://upload.wikimedia.org/wikipedia/commons/9/91/Oahu_Landscape.jpg'),
            fadeOutDuration: Duration(milliseconds: 200),
            height: 300,
            fit: BoxFit.cover,
          ),

          //cargar imagen de internet
          /*Image(
            image: NetworkImage(
                'https://upload.wikimedia.org/wikipedia/commons/9/91/Oahu_Landscape.jpg'),
          ),*/
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text("asdasdasdas"),
          ),
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
        //para poner sombras
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
      ),
      //ClipRRect -> sirve para cortar cualquier cosa que este afuera del container
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      //elevacion
      elevation: 10.0,
      //para los bordes
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.photo_album,
              color: Colors.blue,
            ),
            title: Text('Titulo'),
            subtitle: Text(
                "L'Arianna (en español: Ariadna, SV 291) es la segunda ópera del compositor italiano Claudio Monteverdi, compuesta entre 1607 y 1608. Se estrenó en Mantua el 28 de mayo de 1608 como parte de la celebración de la boda entre el duque Francisco Gonzaga y Margarita de Saboya. Monteverdi la compuso bajo una gran presión de tiempo y afirmó más tarde que el esfuerzo de crearla casi lo mata."),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                child: Text("Cancelar"),
                onPressed: () {},
              ),
              TextButton(
                child: Text("Ok"),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
