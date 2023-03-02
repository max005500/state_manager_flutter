class Usuario {
  String nombre;
  int? edad;
  List<String>? profesiones;

  Usuario({
    this.edad,
    this.profesiones,
    required this.nombre,
  });
}
