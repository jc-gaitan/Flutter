import 'package:powergym/app/models/asistencia_model.dart';
import 'package:powergym/app/models/medidas_model.dart';

class UserModel {
  String photoUrl;
  String name;
  String phoneNumber;
  String gender;
  String age;
  String weight;
  String stature;
  List<Asistencia>? asistencia;
  List<Medidas>? medidas;
  String tipo;

  UserModel({
    required this.name,
    required this.phoneNumber,
    required this.gender,
    required this.age,
    required this.weight,
    required this.stature,
    this.asistencia,
    this.medidas,
    this.tipo = '',
    this.photoUrl =
        'https://firebasestorage.googleapis.com/v0/b/power-gym-ad21a.appspot.com/o/profile%20photo%2Fno-image.png?alt=media&token=ac9711d0-9494-49b1-b7f2-212bdf1d4f73',
  });
}
