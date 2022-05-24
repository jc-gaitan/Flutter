import 'dart:convert';
import 'dart:io';

import 'package:gym_firebase/src/models/user_model.dart';
import 'package:gym_firebase/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime_type/mime_type.dart';

class UserProvider {
  //url base de datos
  final String _url = 'https://flutter-app-8f08b-default-rtdb.firebaseio.com';

  final _prefs = new PreferenciasUsuario();

  Future<bool> crearUsuario(UserModel usuario) async {
    final url = '$_url/usuarios.json?auth=${_prefs.token}';

    final resp =
        await http.post(Uri.parse(url), body: userModelToJson(usuario));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }

  Future<UserModel> cargarUsuario() async {
    final url = '$_url/usuarios.json?auth=${_prefs.token}';

    final resp = await http.get(Uri.parse(url));

    final Map<String, dynamic> decodedData = json.decode(resp.body);

    //if (decodedData == null) return [];

    UserModel usuario = new UserModel();

    decodedData.forEach((id, user) {
      final userTemp = UserModel.fromJson(user);
      userTemp.id = id;

      if (_prefs.email == userTemp.email) {
        usuario = userTemp;
        //print(usuario.id);
        editarUsuario(usuario);
      }
    });

    //print(decodedData);

    return usuario;
  }

  Future<int> borrarUsuario(String id) async {
    final url = '$_url/usuarios/$id.json?auth=${_prefs.token}';

    final resp = await http.delete(Uri.parse(url));

    print(json.decode(resp.body));

    return 1;
  }

  Future<bool> editarUsuario(UserModel usuario) async {
    final url = '$_url/usuarios/${usuario.id}.json?auth=${_prefs.token}';

    final resp = await http.put(Uri.parse(url), body: userModelToJson(usuario));

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
