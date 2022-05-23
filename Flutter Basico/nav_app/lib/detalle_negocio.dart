import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class detalle extends StatelessWidget {
  const detalle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: double.infinity,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 200.0,
              child: FadeInImage(
                placeholder: AssetImage('assets/jar-loading.gif'),
                image: NetworkImage(
                    'https://upload.wikimedia.org/wikipedia/commons/9/91/Oahu_Landscape.jpg'),
                fadeOutDuration: Duration(milliseconds: 200),
                //height: 300,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 176,
              left: 0,
              right: 0,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 50.0),
                padding: EdgeInsets.symmetric(vertical: 10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  //borderRadius: BorderRadius.circular(10.0),
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
                child: Row(
                  children: [
                    SizedBox(width: 15.0),
                    Text('Siganos: '),
                    SizedBox(width: 25.0),
                    Icon(Icons.ac_unit),
                    SizedBox(width: 10.0),
                    Icon(Icons.ac_unit),
                    SizedBox(width: 10.0),
                    Icon(Icons.ac_unit),
                    SizedBox(width: 10.0),
                    Icon(Icons.ac_unit),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 220,
              child: Column(
                children: [
                  Container(
                    width: displayWidth,
                    padding:
                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 32.0),
                    child: Text(
                      'Droguería la Economía',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.black, width: 0.5),
                      ),
                      //color: Colors.red,
                    ),
                  ),
                  Container(
                    //margin: EdgeInsets.symmetric(vertical: 10.0),
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    width: displayWidth,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.black, width: 0.5),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        item(),
                        item(),
                        item(),
                        item(),
                        item(),
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 32.0),
                    width: displayWidth,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.black, width: 0.5),
                      ),
                      //color: Colors.red,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Dale un ranking al anunciante',
                              style: TextStyle(fontSize: 12.0),
                            ),
                            SizedBox(height: 5.0),
                            Container(
                              //para calificar
                              child: RatingBar.builder(
                                ignoreGestures:
                                    false, //true ignora el cambio de nota, solo seria para visualizarla
                                initialRating: 3,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 25.0,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Color.fromRGBO(13, 206, 225, 1),
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.ac_unit,
                              size: 30.0,
                            ),
                            SizedBox(width: 5.0),
                            Text(
                              '35',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: displayWidth,
                    padding:
                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 32.0),
                    child: Text(
                      'Publicacion 1',
                      style: TextStyle(fontSize: 14.0),
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.black, width: 0.5),
                      ),
                      //color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget item() {
    return Column(
      children: [Icon(Icons.ac_unit), Text('asd')],
    );
  }
}
