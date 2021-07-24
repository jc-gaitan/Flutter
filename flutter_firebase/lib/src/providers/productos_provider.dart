import 'dart:convert';
import 'dart:io';

import 'package:formvalidation/src/preferencia_usuario/preferencias_usuario.dart';
import 'package:http/http.dart' as http;

import 'package:http_parser/http_parser.dart';

import 'package:mime_type/mime_type.dart';

import 'package:formvalidation/src/models/productor_model.dart';

class ProductosProvider {
  //url base de datos
  final String _url = 'https://flutter-app-8f08b-default-rtdb.firebaseio.com';

  final _prefs = new PreferenciasUsuario();

  Future<bool> crearProducto(ProductoModel producto) async {
    final url = '$_url/productos.json?auth=${_prefs.token}';

    final resp =
        await http.post(Uri.parse(url), body: productoModelToJson(producto));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }

  Future<List<ProductoModel>> cargarProductos() async {
    final url = '$_url/productos.json?auth=${_prefs.token}';

    final resp = await http.get(Uri.parse(url));

    final Map<String, dynamic> decodedData = json.decode(resp.body);

    //if (decodedData == null) return [];

    final List<ProductoModel> productos = [];

    decodedData.forEach((id, prod) {
      final prodTemp = ProductoModel.fromJson(prod);
      prodTemp.id = id;

      productos.add(prodTemp);
    });

    //print(decodedData);

    return productos;
  }

  Future<int> borrarProducto(String id) async {
    final url = '$_url/productos/$id.json?auth=${_prefs.token}';

    final resp = await http.delete(Uri.parse(url));

    print(json.decode(resp.body));

    return 1;
  }

  Future<bool> editarProducto(ProductoModel producto) async {
    final url = '$_url/productos/${producto.id}.json?auth=${_prefs.token}';

    final resp =
        await http.put(Uri.parse(url), body: productoModelToJson(producto));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }

  Future<String> subirImagen(File imagen) async {
    final url = Uri.parse(
        'https://api.cloudinary.com/v1_1/dhxafvl7x/image/upload?upload_preset=kiomhzmm');

    final mineType = mime(imagen.path)!
        .split('/'); // para sacar el tipo de archivo de la img

    final imageUploadRequest = http.MultipartRequest('POST', url);

    final file = await http.MultipartFile.fromPath('file', imagen.path,
        contentType: MediaType(mineType[0], mineType[1]));

    imageUploadRequest.files.add(file);

    final streamedResponse = await imageUploadRequest.send();

    final resp = await http.Response.fromStream(streamedResponse);

    if (resp.statusCode != 200 && resp.statusCode != 201) {
      print('Algo salio mal');
      print(resp.body);
      return '';
    }

    final respData = json.decode(resp.body);

    print(respData['secure_url']);

    return respData['secure_url'];
  }
}
