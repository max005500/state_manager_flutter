import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_manager/models/usuarios.dart';
import 'package:state_manager/services/usuario_service.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({super.key});

  @override
  Widget build(BuildContext context) {
    final UsuarioService usuarioService = Provider.of<UsuarioService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Provider")),
        backgroundColor: Colors.indigo,
        actions: [
          IconButton(
              onPressed: () => usuarioService.removeUser(),
              icon: Icon(Icons.refresh))
        ],
      ),
      body: usuarioService.usuario != null
          ? InformacionUsuario(user: usuarioService.usuario)
          : const Center(child: Text('no info')),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.accessibility_new),
        onPressed: () => Navigator.pushNamed(context, 'pagina2'),
        backgroundColor: Colors.indigo,
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  Usuario? user;
  InformacionUsuario({
    required this.user,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
              "nombre: ${user?.nombre}",
            ),
          ),
          ListTile(
            title: Text(
              "edad: ${user?.edad}",
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
            child: ListView.separated(
              separatorBuilder: (_, __) => const SizedBox(
                height: 1,
              ),
              itemBuilder: (_, index) => ListTile(
                title: Text(
                  "profesion ${index + 1}: ${user?.profesiones[index]}",
                ),
              ),
              itemCount: user?.profesiones.length ?? 0,
            ),
          ),
        ],
      ),
    );
  }
}
