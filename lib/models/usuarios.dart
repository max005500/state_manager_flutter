class Usuarios {
  final String nombre;
  final int edad;
  final List<String> profesiones;

  Usuarios({
    required this.edad,
    required this.profesiones,
    required this.nombre,
  });
  Usuarios copyWith({
    String? nombre,
    int? edad,
    List<String>? profesiones,
  }) {
    return Usuarios(
        nombre: nombre ?? this.nombre,
        edad: edad ?? this.edad,
        profesiones: profesiones ?? this.profesiones);
  }
}
