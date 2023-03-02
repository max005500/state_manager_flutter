import 'package:flutter/material.dart';
import 'package:state_manager/models/usuarios.dart';
import 'package:state_manager/services/usuario_service.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({super.key});
  @override
  Widget build(BuildContext context) {
    Stream<Usuario?> user = usuarioServices.streamUser;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Singleton"),
        backgroundColor: Colors.amber,
        elevation: 0,
      ),
      body: StreamBuilder(
        stream: user,
        builder: (BuildContext context, AsyncSnapshot<Usuario?> snapshot) {
          return snapshot.hasData
              ? InformacionUsuario(usuario: snapshot.data)
              : const Center(child: Text('no data'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        child: const Icon(Icons.accessibility_new),
        onPressed: () =>
            Navigator.pushNamed(context, 'pagina2', arguments: user),
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  Usuario? usuario;
  InformacionUsuario({
    required this.usuario,
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
              "nombre: ${usuario?.nombre}",
            ),
          ),
          // if (usuario.profesiones != null)
          ListTile(
            title: Text(
              "edad: ${usuario?.edad}",
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
                  "profesion ${index + 1}: ${usuario?.profesiones?[index]}",
                ),
              ),
              itemCount: usuario?.profesiones?.length ?? 0,
            ),
          ),
        ],
      ),
    );
  }
}
