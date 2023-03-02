import 'package:flutter/material.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("Pagina 2"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CustomButtom(texto: 'Establecer Usuario'),
            CustomButtom(texto: 'Cambiar Edad'),
            CustomButtom(texto: 'Anadir Profesion'),
          ],
        ),
      ),
    );
  }
}

class CustomButtom extends StatelessWidget {
  final String texto;
  const CustomButtom({
    required this.texto,
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
      onPressed: () => {},
      child: Text(
        texto,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
