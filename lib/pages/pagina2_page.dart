import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_manager/bloc/user/user_bloc.dart';
import 'package:state_manager/models/usuarios.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({super.key});

  @override
  Widget build(BuildContext context) {
    final userBlock = BlocProvider.of<UserBloc>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text("Pagina 2"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButtom(
                texto: 'Establecer Usuario',
                press: () {
                  final newUser = new User(
                    nombre: 'max',
                    edad: 22,
                    profesiones: [
                      'estudiante',
                      'programador',
                    ],
                  );
                  userBlock.add(ActivateUser(newUser));
                }),
            CustomButtom(
              texto: 'Cambiar Edad',
              press: () => userBlock.add(
                ChangeUserAge(23),
              ),
            ),
            CustomButtom(
              texto: 'Anadir Profesion',
              press: () => userBlock.add(
                AddUserProfession('ingeniero electronico'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButtom extends StatelessWidget {
  final String texto;
  final void Function() press;
  const CustomButtom({
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
      color: Colors.pink,
      elevation: 0,
      onPressed: () => press(),
      child: Text(
        texto,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
