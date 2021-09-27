import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:powergym/app/models/asistencia_model.dart';
import 'package:powergym/app/models/medidas_model.dart';
import 'package:powergym/app/models/user_model.dart';

class UserProvider {
  static final _auth = FirebaseAuth.instance;
  static final _firestore = FirebaseFirestore.instance;

  //añade usuario a la bd
  static void addUser(
    UserModel data, {
    Function()? onSuccess,
    Function(Object)? onError,
  }) async {
    await _firestore.collection('users').doc(_auth.currentUser!.uid).set({
      'name': data.name,
      'phone_number': data.phoneNumber,
      'gender': data.gender,
      'age': data.age,
      'weight': data.weight,
      'stature': data.stature,
      'tipo': data.tipo,
      'medidas': List<dynamic>.from(data.medidas!.map((x) => x.toJson())),
      'asistencia': List<dynamic>.from(data.asistencia!.map((x) => x.toJson())),
      'photoUrl': data.photoUrl,
    }, SetOptions(merge: true)).then((value) {
      if (onSuccess != null) onSuccess();
    }).catchError(
      onError ??
          (_) {
            log("add user : failed");
          },
    );
  }

  static Future<UserModel?> getUser() async {
    UserModel? user;
    if (_auth.currentUser != null) {
      var phoneNumber = _auth.currentUser!.phoneNumber!;
      //
      await _firestore
          .collection('users')
          .where('phone_number', isEqualTo: phoneNumber)
          .get()
          .then((result) {
        //
        if (result.docs.length > 0) {
          user = UserModel(
            name: result.docs[0].data()['name'],
            phoneNumber: phoneNumber,
            gender: result.docs[0].data()['gender'],
            stature: result.docs[0].data()['stature'],
            age: result.docs[0].data()['age'],
            tipo: result.docs[0].data()['tipo'],
            weight: result.docs[0].data()['weight'],
            photoUrl: result.docs[0].data()['photoUrl'],
            asistencia: List<Asistencia>.from(result.docs[0]
                .data()['asistencia']
                .map((x) => Asistencia.fromJson(x))),
            medidas: List<Medidas>.from(result.docs[0]
                .data()['medidas']
                .map((x) => Medidas.fromJson(x))),
          );
          //print(user!.medidas!.last.mes);
          //print(result.docs[0].data()['medidas']);
        }
      }).catchError((_) {
        print('error');
      });
    }
    return user;
  }

  /*Future<int> borrarUsuario(String id) async {

  }

  Future<bool> editarUsuario(UserModel usuario) async {

  }

  Future<String> subirImagen(File imagen) async {

  }*/

  /// Verifica si el numero existe en la bd --> return true if phone number already exists
  static Future<bool> phoneNumberExists(String phoneNumber,
      {Function(Object)? onError}) async {
    var isValidUser = false;

    await _firestore
        .collection('users')
        .where('phone_number', isEqualTo: phoneNumber)
        .get()
        .then((result) {
      if (result.docs.length > 0) {
        isValidUser = true;
      }
    }).catchError(
      onError ??
          (_) {
            log("checking phone number : failed");
          },
    );

    return isValidUser;
  }
}
