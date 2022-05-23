import 'package:flutter/material.dart';

class ListaNegocios extends StatelessWidget {
  const ListaNegocios({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //datos prueba
    List negociosD = ['asd', 'asd', 'asd'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Drogerias'),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: GridView.count(
        padding: EdgeInsets.all(20.0),
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        children: negocios(negociosD),
      ),
    );
  }

  List<Widget> negocios(List negocios) {
    List<Widget> cards = [];
    for (var element in negocios) {
      cards.add(targeta(element));
    }

    return cards;
  }

  Widget targeta(element) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 95.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
              child: FadeInImage(
                placeholder: AssetImage('assets/jar-loading.gif'),
                image: NetworkImage(
                    'https://upload.wikimedia.org/wikipedia/commons/9/91/Oahu_Landscape.jpg'),
                fadeOutDuration: Duration(milliseconds: 200),
                //height: 300,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            child: Text(element),
            padding: EdgeInsets.symmetric(vertical: 2.0),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.ac_unit),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Icon(Icons.ac_unit),
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(color: Colors.black, width: 1.0),
                      left: BorderSide(color: Colors.black, width: 1.0),
                    ),
                  ),
                ),
                Icon(Icons.ac_unit),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
