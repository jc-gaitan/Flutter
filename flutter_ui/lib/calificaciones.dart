import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Calificaciones extends StatefulWidget {
  const Calificaciones({Key? key}) : super(key: key);

  @override
  State<Calificaciones> createState() => _CalificacionesState();
}

class _CalificacionesState extends State<Calificaciones> {
  /*String descText =
      "Description Line 1\nDescription Line 2\nDescription Line 3\nDescription Line 4\nDescription Line 5\nDescription Line 6\nDescription Line 7\nDescription Line 8";*/
  String descText =
      "El asesinato de Calvo Sotelo se produjo en Madrid (España) en la madrugada del lunes 13 de julio de 1936, durante la Segunda República Española, cuando un grupo de guardias de asalto y de miembros de las milicias socialistas encabezado por un capitán de la Guardia Civil de paisano se presentaron en el domicilio del líder monárquico José Calvo Sotelo con el pretexto de conducirlo a la Dirección General de Seguridad y, en el trayecto, el socialista Luis Cuenca Estevas le disparó dos tiros en la nuca, llevando a continuación su cuerpo al depósito de cadáveres del cementerio de La Almudena. El crimen era una represalia por el asesinato unas";
  bool descTextShowFlag = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const ListTile(
          title: Text("NOMBRE NEGOCIO"),
          subtitle: Text("Calificaciones y opiniones"),
          contentPadding: EdgeInsets.all(0.0),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                CircleAvatar(),
                SizedBox(width: 20.0),
                Text("JOSE MARIA"),
              ],
            ),
            const SizedBox(height: 12.0),
            Row(
              children: [
                RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  ignoreGestures: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemSize: 20.0,
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                const SizedBox(width: 20.0),
                const Text("04/09/20"),
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
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
