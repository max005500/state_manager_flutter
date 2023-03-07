import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_manager/controllers/usuario_controller.dart';
import 'package:state_manager/models/usuarios.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({super.key});

  @override
  Widget build(BuildContext context) {
    final userCtrl = Get.find<UsuarioController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("Pagina 2"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButtom(
              texto: 'Establecer Usuario',
              press: () {
                userCtrl.cargarUsuario(
                  Usuarios(
                    edad: 22,
                    professiones: ['progra'],
                    nombre: 'max',
                  ),
                );
                Get.snackbar('bienvenido', '${userCtrl.user.value.nombre}',
                    backgroundColor: Colors.white);
              },
            ),
            CustomButtom(
                texto: 'Cambiar Edad', press: () => userCtrl.cambiarEdad(23)),
            CustomButtom(
                texto: 'Anadir Profesion',
                press: () => userCtrl.agregarProfesion('estudiante')),
            CustomButtom(
                texto: 'cambiar el tema',
                press: () => Get.changeTheme(
                    Get.isDarkMode ? ThemeData.light() : ThemeData.dark())),
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
      color: Colors.teal,
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
