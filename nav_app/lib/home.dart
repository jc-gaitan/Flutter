import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('pagina'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: GridView.count(
          crossAxisCount: 4,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
          children: asd(),
        ),
      ),
    );
  }

  List<Widget> asd() {
    List<Widget> x = [];
    List<String> texts = [
      '    Entregas   ',
      '    Taxi   ',
      '    Tendero   ',
      '    Hogar     ',
      '    24 hrs    ',
      '   Eventos    ',
      '  Catálogos   ',
      '     Rumba    ',
      '    Cursos    ',
      '   Urgencias  ',
      '   Talleres   ',
      ' Profesionales'
    ];
    for (int i = 0; i < 12; i++) {
      x.add(Container(
        color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite,
              color: Colors.pink,
              size: 32.0,
            ),
            Text(
              texts[i],
              style: TextStyle(fontSize: 12.0),
            ),
          ],
        ),
      ));
    }
    return x;
  }
}
