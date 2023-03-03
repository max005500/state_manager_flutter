// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';

import 'package:state_manager/models/usuarios.dart';

class UsuarioService with ChangeNotifier {
  Usuario? _usuario;
  Usuario? get usuario => this._usuario;
}
