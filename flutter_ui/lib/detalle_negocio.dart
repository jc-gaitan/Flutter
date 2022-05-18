import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_ui/calificaciones.dart';
import 'package:flutter_ui/calificar.dart';
import 'package:flutter_ui/navbar_screen.dart';
//import 'package:flutter_ui/home_view/navbar_widget.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({Key? key}) : super(key: key);

  //final Widget child;

  //const DemoPage({required Key key, required this.child}) : super(key: key);

  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  /*String descText =
      "Description Line 1\nDescription Line 2\nDescription Line 3\nDescription Line 4\nDescription Line 5\nDescription Line 6\nDescription Line 7\nDescription Line 8";*/
  String descText =
      "El asesinato de Calvo Sotelo se produjo en Madrid (España) en la madrugada del lunes 13 de julio de 1936, durante la Segunda República Española, cuando un grupo de guardias de asalto y de miembros de las milicias socialistas encabezado por un capitán de la Guardia Civil de paisano se presentaron en el domicilio del líder monárquico José Calvo Sotelo con el pretexto de conducirlo a la Dirección General de Seguridad y, en el trayecto, el socialista Luis Cuenca Estevas le disparó dos tiros en la nuca, llevando a continuación su cuerpo al depósito de cadáveres del cementerio de La Almudena. El crimen era una represalia por el asesinato unas";
  bool descTextShowFlag = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalle negocio"),
      ),
      body: Container(
        margin: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text("Si no ha calificado negocio poner -----"),
            const ListTile(
              title: Text(
                "Califica este negocio",
                style: TextStyle(
                  fontSize: 16.0,
                  //fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              subtitle: Text("Comparte tu opinión con otros usuarios"),
              contentPadding: EdgeInsets.all(0.0),
            ),
            RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 20.0),
              glow: false,
              wrapAlignment: WrapAlignment.spaceBetween,
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              itemSize: 30.0,
              onRatingUpdate: (rating) {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Calificar()));
              },
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text("Si ya ha calificado negocio poner -----"),
            ),
            const ListTile(
              title: Text(
                "Tu opinión",
                style: TextStyle(
                  fontSize: 16.0,
                  //fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              contentPadding: EdgeInsets.all(0.0),
            ),
            Row(
              children: [
                const CircleAvatar(),
                const SizedBox(width: 20.0),
                Flexible(
                  child: ListTile(
                    title: const Text("Nombre Usuario"),
                    subtitle: Row(
                      children: [
                        RatingBar.builder(
                          initialRating: 5,
                          minRating: 1,
                          direction: Axis.horizontal,
                          ignoreGestures: true,
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 1.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemSize: 20.0,
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        const SizedBox(width: 10.0),
                        const Text("04/04/20"),
                      ],
                    ),
                    contentPadding: const EdgeInsets.all(0.0),
                  ),
                ),
                Theme(
                  data: Theme.of(context).copyWith(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                  ),
                  child: PopupMenuButton(
                    tooltip: "",
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    icon: const Icon(Icons.more_vert),
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        child: Text("Editar"),
                        value: 1,
                      ),
                      const PopupMenuItem(
                        child: Text("Eliminar"),
                        value: 2,
                      )
                    ],
                    iconSize: 25.0,
                    onSelected: (value) {
                      if (value == 1) {
                        print("Editar");
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Calificar()));
                      } else {
                        print("Eliminar");
                      }
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12.0),
            InkWell(
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                setState(() {
                  descTextShowFlag = !descTextShowFlag;
                });
              },
              child: Text(
                descTextShowFlag ? descText : "$descText...",
                maxLines: descTextShowFlag ? null : 3,
                textAlign: TextAlign.start,
                overflow: descTextShowFlag ? null : TextOverflow.ellipsis,
                //softWrap: true,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Calificaiones y opiniones",
                  style: TextStyle(
                    fontSize: 20.0,
                    //fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Calificaciones())),
                  icon: const Icon(Icons.arrow_forward),
                  splashRadius: 20.0,
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  "4.4",
                  style: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 20.0),
                Flexible(
                  child: ListTile(
                    title: RatingBar.builder(
                      initialRating: 4.4,
                      minRating: 1,
                      direction: Axis.horizontal,
                      ignoreGestures: true,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemSize: 20.0,
                      onRatingUpdate: (rating) {
                        //print(rating);
                      },
                    ),
                    subtitle: const Text(" 29.756.728"),
                    contentPadding: const EdgeInsets.all(0.0),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      //bottomNavigationBar: NavBar(),
    );
  }
}
