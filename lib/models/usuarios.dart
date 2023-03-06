class User {
  String nombre;
  int edad;
  List<String> profesiones;

  User({
    required this.edad,
    required this.profesiones,
    required this.nombre,
  });
 User copyWith({
  String? nombre,
  int? edad,
  List<String>? profesiones,
  }) => User(edad: edad??this.edad, profesiones: profesiones??this.profesiones, nombre: nombre??this.nombre,);
}
