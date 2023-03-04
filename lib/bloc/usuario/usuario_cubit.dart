import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_manager/models/usuarios.dart';

part 'usuarios_state.dart';

class UsuarioCubit extends Cubit<UsuarioState> {
  UsuarioCubit() : super(UsuarioInitial());
  void selectUser(Usuarios user) {
    emit(UsuarioActivo(user));
  }

  void cambiarEdad(int edad) {
    final currentState = state;
    if (currentState is UsuarioActivo) {
      final newUser = currentState.usuario.copyWith(edad: 82);
      emit(UsuarioActivo(newUser));
    }
  }

  void borrarUsuario() {
    emit(UsuarioInitial());
  }

  String nombre() {
    final currentState = state;

    if (currentState is UsuarioActivo) {
      return currentState.usuario.nombre;
    }
    return 'no user';
  }

  void agregarProfesion(String profesion) {
    final currentState = state;
    if (currentState is UsuarioActivo) {
      final newProfesiones = [...currentState.usuario.profesiones, profesion];
      final newUser =
          currentState.usuario.copyWith(profesiones: newProfesiones);
      emit(UsuarioActivo(newUser));
    }
  }
}
