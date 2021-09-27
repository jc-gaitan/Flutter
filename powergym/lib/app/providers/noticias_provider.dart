import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:powergym/app/models/noticias_model.dart';

class NoticiasProvider {
  static final _auth = FirebaseAuth.instance;
  static final _firestore = FirebaseFirestore.instance;

  //añade noticias a la bd
  static void addNoticia(
    NoticiasModel data, {
    Function()? onSuccess,
    Function(Object)? onError,
  }) async {
    await _firestore.collection('news').doc(_auth.currentUser!.uid).set({
      'title': data.titulo,
      'message': data.mensaje,
      'photoUrl': data.fotoUrl,
    }, SetOptions(merge: true)).then((value) {
      if (onSuccess != null) onSuccess();
    }).catchError(
      onError ??
          (_) {
            log("add user : failed");
          },
    );
  }

  static Future<List<NoticiasModel?>> getNoticias() async {
    List<NoticiasModel?> noticias = [];
    if (_auth.currentUser != null) {
      //
      await _firestore.collection('news').get().then((result) {
        //
        if (result.docs.length > 0) {
          //print(result.docs);
        }
      }).catchError((_) {
        print('error');
      });
    }
    return noticias;
  }
}
