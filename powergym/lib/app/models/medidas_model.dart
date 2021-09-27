class Medidas {
  Medidas({
    required this.dia,
    required this.mes,
    required this.year,
    required this.cuello,
    required this.hombros,
    required this.pecho,
    required this.biceps,
    required this.cintura,
    required this.brazo,
    required this.cadera,
    required this.muslo,
    required this.gemelo,
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
