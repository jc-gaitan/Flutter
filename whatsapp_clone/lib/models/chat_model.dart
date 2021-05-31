class ChatModel {
  final String name;
  String message;
  final String time;
  final String imageUrl;

  ChatModel(this.name, this.message, this.time, this.imageUrl);
}

String url =
    "https://upload.wikimedia.org/wikipedia/commons/e/ed/Elon_Musk_Royal_Society.jpg";
//https://pbs.twimg.com/profile_images/589901898724966400/vL0HcdMB_400x400.jpg

List<ChatModel> messageData = [
  new ChatModel("Martin Fwoler", "Hola como estas?", "12:30", url),
  new ChatModel("Jorge Gaitan", "cami", "06:30", url),
  new ChatModel("jose", "asd", "08:30", url),
  new ChatModel("andres", "qwerty", "06:01", url),
  new ChatModel("velandia", "asdqwedqw qweqwe", "07:12", url),
  new ChatModel("yefrei", "q84we98qw4e", "02:45", url),
];
