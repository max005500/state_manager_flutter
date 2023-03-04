import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_manager/bloc/usuario/usuario_cubit.dart';
import 'package:state_manager/models/usuarios.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({super.key});

  @override
  Widget build(BuildContext context) {
    final newUser =
        new Usuarios(edad: 24, profesiones: ['playboy'], nombre: 'max');
    final state = context.read<UsuarioCubit>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text("Pagina 2"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButtom(
              texto: 'Establecer Usuario',
              press: () {
                state.selectUser(newUser);
              },
            ),
            CustomButtom(
              texto: 'Cambiar Edad',
              press: () => state.cambiarEdad(37),
            ),
            CustomButtom(
              texto: 'Anadir Profesion',
              press: () => state.agregarProfesion('ingeniero en criterio'),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButtom extends StatelessWidget {
  final String texto;
  void Function() press;
  CustomButtom({
    required this.texto,
    required this.press,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      color: Colors.purple,
      elevation: 0,
      onPressed: press,
      child: Text(
        texto,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
