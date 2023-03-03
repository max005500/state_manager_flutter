// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';

import 'package:state_manager/models/usuarios.dart';

class UsuarioService with ChangeNotifier {
  Usuario? _usuario;
  Usuario? get usuario => this._usuario;
  set usuario(Usuario? user) {
    this._usuario = user;
    notifyListeners();
  }

  void edad(int edad) {
    this._usuario?.edad = edad;
    notifyListeners();
  }

  void removeUser() {
    this._usuario = null;
    notifyListeners();
  }

  void addProfession(String? profesion) {
    if (profesion != null) this._usuario?.profesiones.add(profesion);
    notifyListeners();
  }
}
