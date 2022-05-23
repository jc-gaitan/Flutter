// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.id = '',
    this.email = '',
    this.nombre = '',
    this.fotoUrl =
        'https://firebasestorage.googleapis.com/v0/b/flutter-app-8f08b.appspot.com/o/no-image.png?alt=media&token=dbdce896-664c-4c1c-9fc4-f2311e810197',
    this.estatura = '0m',
    this.peso = '0Kg',
    this.edad = '0',
    this.sexo = '',
    this.puntos = '0',
    this.membresia = 'Gold',
    this.asistencia,
    this.medidas,
    this.tipo = '',
    this.x = '',
  });

  String id;
  String email;
  String nombre;
  String fotoUrl;
  String estatura;
  String peso;
  String edad;
  String sexo;
  String puntos;
  String membresia;
  List<Asistencia>? asistencia;
  List<Medidas>? medidas;
  String tipo;
  String x;

  Asistencia asisten(String dia, String mes, String year, String minutos) {
    //crea la asistencia del dia
    return Asistencia(dia: dia, mes: mes, year: year, minutos: minutos);
  }

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        email: json["email"],
        nombre: json["nombre"],
        fotoUrl: json["fotoUrl"],
        estatura: json["estatura"],
        peso: json["peso"],
        edad: json["edad"],
        sexo: json["sexo"],
        puntos: json["puntos"],
        membresia: json["membresia"],
        tipo: json["tipo"],
        asistencia: List<Asistencia>.from(
            json["asistencia"].map((x) => Asistencia.fromJson(x))),
        medidas:
            List<Medidas>.from(json["medidas"].map((x) => Medidas.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "nombre": nombre,
        "fotoUrl": fotoUrl,
        "estatura": estatura,
        "peso": peso,
        "edad": edad,
        "sexo": sexo,
        "puntos": puntos,
        "membresia": membresia,
        "tipo": tipo,
        "asistencia": List<dynamic>.from(asistencia!.map((x) => x.toJson())),
        "medidas": List<dynamic>.from(medidas!.map((x) => x.toJson())),
      };
}

class Asistencia {
  Asistencia({
    this.dia = '',
    this.mes = '',
    this.year = '',
    this.minutos = '',
  });

  String dia;
  String mes;
  String year;
  String minutos;

  factory Asistencia.fromJson(Map<String, dynamic> json) => Asistencia(
        dia: json["dia"],
        mes: json["mes"],
        year: json["year"],
        minutos: json["minutos"],
      );

  Map<String, dynamic> toJson() => {
        "dia": dia,
        "mes": mes,
        "year": year,
        "minutos": minutos,
      };
}

class Medidas {
  Medidas({
    this.dia = '',
    this.mes = '',
    this.year = '',
    this.cuello = '',
    this.hombros = '',
    this.pecho = '',
    this.biceps = '',
    this.cintura = '',
    this.brazo = '',
    this.cadera = '',
    this.muslo = '',
    this.gemelo = '',
  });

  String dia;
  String mes;
  String year;
  String cuello;
  String hombros;
  String pecho; //pecho = busto
  String biceps;
  String cintura;
  String brazo;
  String cadera; //el hombre no tiene cadera
  String muslo;
  String gemelo;

  factory Medidas.fromJson(Map<String, dynamic> json) => Medidas(
        dia: json["dia"],
        mes: json["mes"],
        year: json["year"],
        cuello: json["cuello"],
        hombros: json["hombros"],
        pecho: json["pecho"],
        biceps: json["biceps"],
        cintura: json["cintura"],
        brazo: json["brazo"],
        cadera: json["cadera"],
        muslo: json["muslo"],
        gemelo: json["gemelo"],
      );

  Map<String, dynamic> toJson() => {
        "dia": dia,
        "mes": mes,
        "year": year,
        "cuello": cuello,
        "hombros": hombros,
        "pecho": pecho,
        "biceps": biceps,
        "cintura": cintura,
        "brazo": brazo,
        "cadera": cadera,
        "muslo": muslo,
        "gemelo": gemelo,
      };
}
