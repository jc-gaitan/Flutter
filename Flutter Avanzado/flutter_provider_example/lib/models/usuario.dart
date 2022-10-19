class Usuario {
  String nombre;
  int edad;
  List<String> profesiones;

  Usuario(
      {required this.nombre, required this.edad, this.profesiones = const []});
}
