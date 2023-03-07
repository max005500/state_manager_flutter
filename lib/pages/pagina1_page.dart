import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_manager/controllers/usuario_controller.dart';
import 'package:state_manager/models/usuarios.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({super.key});

  @override
  Widget build(BuildContext context) {
    final UsuarioCtrl = Get.put(UsuarioController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pagina 1"),
        backgroundColor: Colors.teal,
      ),
      body: Obx(() =>
          UsuarioCtrl.existeUsuario.value ? InformacionUsuario(user: UsuarioCtrl.user.value) : BadState()),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.accessibility_new),
        backgroundColor: Colors.teal,
        // onPressed: () => Navigator.pushNamed(context, 'pagina2'),
        onPressed: () =>
            Get.toNamed('pagina2', arguments: {'nombre': 'max', 'edad': 24}),
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
 final Usuarios user;
  const InformacionUsuario({
  required this.user,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return   Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "General",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          ListTile(
            title: Text(
              "nombre: ${user.nombre}",
            ),
          ),
          ListTile(
            title: Text(
              "edad: ${user.edad}",
            ),
          ),
          const Text(
            "Profesiones",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          Expanded(
              child: ListView.builder(
            itemCount: user.professiones.length,
            itemBuilder: (_, i) => ListTile(
              title: Text(
                'profesion ${i + 1}: ${user.professiones[i]}',
              ),
            ),
          )),
        ],),
      ); 
      }
}

class BadState extends StatelessWidget {
  const BadState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('No hay info sobre usuarios'),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              color: Colors.black12,
              shape: BoxShape.circle,
            ),
            width: 40,
            height: 40,
            child: const CircularProgressIndicator(
              color: Colors.teal,
            ),
          )
        ],
      ),
    );
  }
}
