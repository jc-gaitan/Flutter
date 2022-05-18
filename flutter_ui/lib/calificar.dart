import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Calificar extends StatefulWidget {
  const Calificar({Key? key}) : super(key: key);

  @override
  State<Calificar> createState() => _CalificarState();
}

class _CalificarState extends State<Calificar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              print("ASD");
            },
            child: const Text(
              "PUBLICAR",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
        title: const ListTile(
          title: Text("NOMBRE NEGOCIO"),
          subtitle: Text("Califica este negocio"),
          contentPadding: EdgeInsets.all(0.0),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: const [
                CircleAvatar(),
                SizedBox(width: 20.0),
                Flexible(
                  child: ListTile(
                    title: Text("NOMBRE USUARIO"),
                    subtitle: Text(
                        "Las opiniones son públicas y contienen su información de tu cuenta. "),
                    contentPadding: EdgeInsets.all(0.0),
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 0.0, vertical: 20.0),
              child: RatingBar.builder(
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
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Calificar()));
                },
              ),
            ),
            TextField(
              keyboardType: TextInputType.multiline,
              maxLength: 500,
              maxLines: null,
              decoration: InputDecoration(
                hintText: "Describe tu experiencia (opcional)",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2.0),
                ),
                //filled: true,
                hintStyle: TextStyle(color: Colors.grey[800]),
                //fillColor: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
