import 'package:flutter/material.dart';

import 'package:state_manager/models/usuarios.dart';
import 'package:state_manager/services/usuario_service.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Stream(),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButtom(
              texto: 'Establecer Usuario',
              press: () {
                final newUser = Usuario(
                  edad: 25,
                  profesiones: ['electricista', 'gasfiter'],
                  nombre: 'juan',
                );
                usuarioServices.cargarUsuario(newUser);
              },
            ),
            CustomButtom(
              texto: 'Cambiar Edad',
              press: () {
                usuarioServices.cambiarEdad(35);
              },
            ),
            CustomButtom(texto: 'Anadir Profesion', press: () => null),
          ],
        ),
      ),
    );
  }
}

class Stream extends StatelessWidget {
  const Stream({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: usuarioServices.streamUser,
      builder: (context, AsyncSnapshot<Usuario?> snapshot) {
        return usuarioServices.usuario != null
            ? Text('${usuarioServices.usuario?.nombre}')
            : const Text('Pagina 2');
      },
    );
  }
}

// ignore: must_be_immutable
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
      color: Colors.amber,
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
