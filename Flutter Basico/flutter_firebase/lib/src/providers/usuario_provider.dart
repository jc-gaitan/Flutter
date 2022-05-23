import 'dart:convert';

import 'package:formvalidation/src/preferencia_usuario/preferencias_usuario.dart';
import 'package:http/http.dart' as http;

class UsuarioProvider {
  final String firebaseKey = 'AIzaSyCtBa4lBxB2oqwxwN18JEdvDukZFF0mHvk';

  final _prefs = new PreferenciasUsuario();

  Future<Map<String, dynamic>> login(String email, String password) async {
    String url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$firebaseKey';

    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true,
    };

    final resp = await http.post(Uri.parse(url), body: json.encode(authData));

    Map<String, dynamic> decodedResp = json.decode(resp.body);

    print(decodedResp);

    if (decodedResp.containsKey('idToken')) {
      _prefs.token = decodedResp['idToken'];

      return {'ok': true, 'token': decodedResp['idToken']};
    } else {
      return {'ok': false, 'mensaje': decodedResp['error']['message']};
    }
  }

  Future<Map<String, dynamic>> crearUser(String email, String password) async {
    String url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$firebaseKey';

    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true,
    };

    final resp = await http.post(Uri.parse(url), body: json.encode(authData));

    Map<String, dynamic> decodedResp = json.decode(resp.body);

    print(decodedResp);

    if (decodedResp.containsKey('idToken')) {
      _prefs.token = decodedResp['idToken'];

      return {'ok': true, 'token': decodedResp['idToken']};
    } else {
      return {'ok': false, 'mensaje': decodedResp['error']['message']};
    }
  }
}
