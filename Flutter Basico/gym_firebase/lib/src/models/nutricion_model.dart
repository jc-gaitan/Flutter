// To parse this JSON data, do
//
//     final comidaModel = comidaModelFromJson(jsonString);

import 'dart:convert';

ComidaModel comidaModelFromJson(String str) =>
    ComidaModel.fromJson(json.decode(str));

String comidaModelToJson(ComidaModel data) => json.encode(data.toJson());

class ComidaModel {
  ComidaModel({
    this.id = '',
    required this.nombre,
    required this.ideal,
    this.urlFoto =
        'https://firebasestorage.googleapis.com/v0/b/flutter-app-8f08b.appspot.com/o/noticias%2Fno_image.jpg?alt=media&token=3e9fc267-e26d-446d-be14-683486b7b51f',
    required this.nutricion,
    required this.ingredientes,
    required this.instrucciones,
    required this.tipo,
  });

  String id;
  String nombre;
  String ideal;
  String urlFoto;
  List<String> nutricion;
  List<String> ingredientes;
  List<String> instrucciones;
  String tipo;

  factory ComidaModel.fromJson(Map<String, dynamic> json) => ComidaModel(
        id: json["id"],
        nombre: json["nombre"],
        ideal: json["ideal"],
        urlFoto: json["urlFoto"],
        nutricion: List<String>.from(json["nutricion"].map((x) => x)),
        ingredientes: List<String>.from(json["ingredientes"].map((x) => x)),
        instrucciones: List<String>.from(json["instrucciones:"].map((x) => x)),
        tipo: json["tipo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "ideal": ideal,
        "urlFoto": urlFoto,
        "nutricion": List<dynamic>.from(nutricion.map((x) => x)),
        "ingredientes": List<dynamic>.from(ingredientes.map((x) => x)),
        "instrucciones:": List<dynamic>.from(instrucciones.map((x) => x)),
        "tipo": tipo,
      };
}
