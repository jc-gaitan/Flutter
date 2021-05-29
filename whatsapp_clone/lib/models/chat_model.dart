class ChatModel {
  final String name;
  String message;
  final String time;
  final String imageUrl;

  ChatModel(this.name, this.message, this.time, this.imageUrl);
}

List<ChatModel> messageData = [
  new ChatModel("Martin Fwoler", "Hola como estas?", "12:30",
      "https://upload.wikimedia.org/wikipedia/commons/thumb/3/39/Questionmark_copyright_es.svg/260px-Questionmark_copyright_es.svg.png"),
  new ChatModel("Jorge Gaitan", "cami", "06:30",
      "https://upload.wikimedia.org/wikipedia/commons/thumb/3/39/Questionmark_copyright_es.svg/260px-Questionmark_copyright_es.svg.png"),
  new ChatModel("jose", "asd", "08:30",
      "https://upload.wikimedia.org/wikipedia/commons/thumb/3/39/Questionmark_copyright_es.svg/260px-Questionmark_copyright_es.svg.png"),
  new ChatModel("andres", "qwerty", "06:01",
      "https://upload.wikimedia.org/wikipedia/commons/thumb/3/39/Questionmark_copyright_es.svg/260px-Questionmark_copyright_es.svg.png"),
  new ChatModel("velandia", "asdqwedqw qweqwe", "07:12",
      "https://upload.wikimedia.org/wikipedia/commons/thumb/3/39/Questionmark_copyright_es.svg/260px-Questionmark_copyright_es.svg.png"),
  new ChatModel("yefrei", "q84we98qw4e", "02:45",
      "https://upload.wikimedia.org/wikipedia/commons/thumb/3/39/Questionmark_copyright_es.svg/260px-Questionmark_copyright_es.svg.png"),
];
