// To parse this JSON data, do
//
//     final noticiasModel = noticiasModelFromJson(jsonString);

import 'dart:convert';

NoticiasModel noticiasModelFromJson(String str) =>
    NoticiasModel.fromJson(json.decode(str));

String noticiasModelToJson(NoticiasModel data) => json.encode(data.toJson());

class NoticiasModel {
  NoticiasModel({
    this.id = '',
    required this.titulo,
    required this.mensaje,
    required this.fotoUrl,
  });

  String id;
  String titulo;
  String mensaje;
  String fotoUrl;

  factory NoticiasModel.fromJson(Map<String, dynamic> json) => NoticiasModel(
        titulo: json["titulo"],
        mensaje: json["mensaje"],
        fotoUrl: json["fotoUrl"],
      );

  Map<String, dynamic> toJson() => {
        "titulo": titulo,
        "mensaje": mensaje,
        "fotoUrl": fotoUrl,
      };
}
