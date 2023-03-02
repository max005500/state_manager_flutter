// ignore_for_file: unnecessary_new

import 'dart:async';

import 'package:state_manager/models/usuarios.dart';

final usuarioServices = new _UsuariosService();

class _UsuariosService {
  final StreamController<Usuario?> _usuarioStreamController =
      new StreamController<Usuario?>.broadcast();

  Usuario? _usuario;

  Usuario? get usuario => _usuario;

  Stream<Usuario?> get streamUser => _usuarioStreamController.stream;

  void cargarUsuario(Usuario user) {
    _usuario = user;
    _usuarioStreamController.add(_usuario);
  }

  void cambiarEdad(int edad) {
    _usuario?.edad = edad;
    _usuarioStreamController.add(_usuario);
  }
}
