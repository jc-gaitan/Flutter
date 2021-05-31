import 'package:whatsapp_clone/models/chat_model.dart';

class EstadoModel {
  final String imgUrl;
  final String name;
  final String time;

  EstadoModel(this.imgUrl, this.name, this.time);
}

List<EstadoModel> estados = [
  new EstadoModel(messageData[0].imageUrl, messageData[0].name, "Hoy, 3:00AM"),
  new EstadoModel(messageData[1].imageUrl, messageData[0].name, "Hoy, 3:00AM"),
  new EstadoModel(messageData[2].imageUrl, messageData[0].name, "Hoy, 3:00AM"),
  new EstadoModel(messageData[3].imageUrl, messageData[0].name, "Hoy, 3:00AM"),
  new EstadoModel(messageData[4].imageUrl, messageData[0].name, "Hoy, 3:00AM"),
  new EstadoModel(messageData[5].imageUrl, messageData[0].name, "Hoy, 3:00AM")
];
