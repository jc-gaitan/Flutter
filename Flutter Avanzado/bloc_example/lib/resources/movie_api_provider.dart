import 'dart:async';
import 'package:http/http.dart' show Client;
import 'package:logger/logger.dart';
import 'dart:convert';
import '../models/item_model.dart';

class MovieApiProvider {
  Client client = Client();
  final _apiKey = 'b92da2062a36e64287fac18b03d1bad5';

  var logger = Logger();

  Future<ItemModel> fetchMovieList() async {
    logger.i("Entro fetchMovieList");

    final String apiUrl =
        "http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey";
    // Convierte la cadena de texto a un objeto Uri
    final Uri uri = Uri.parse(apiUrl);
    // Realiza la solicitud HTTP utilizando el objeto Uri
    final response = await client.get(uri);
    // Log de la respuesta
    logger.i(response.body.toString());
    if (response.statusCode == 200) {
      // Si la llamada al servidor fue exitosa, analiza el JSON.
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      // Si esa llamada no fue exitosa, lanza un error.
      logger.e('Failed to load post');
      throw Exception('Failed to load post');
    }
  }
}
