class Asistencia {
  Asistencia({
    required this.day,
    required this.month,
    required this.year,
    required this.minutes,
  });

  String day;
  String month;
  String year;
  String minutes;

  factory Asistencia.fromJson(Map<String, dynamic> json) => Asistencia(
        day: json["day"],
        month: json["month"],
        year: json["year"],
        minutes: json["minutes"],
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "month": month,
        "year": year,
        "minutes": minutes,
      };
}
