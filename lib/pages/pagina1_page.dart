import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_manager/bloc/usuario/usuario_cubit.dart';
import 'package:state_manager/models/usuarios.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.read<UsuarioCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("cubit"),
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
              onPressed: () => state.borrarUsuario(),
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: BlocBuilder<UsuarioCubit, UsuarioState>(
        builder: (_, state) {
          if (state is UsuarioActivo) {
            return InformacionUsuario(user: state.usuario);
          }
          return const BadState();
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        child: const Icon(Icons.accessibility_new),
        onPressed: () => Navigator.pushNamed(context, 'pagina2'),
      ),
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
              color: Colors.purple,
            ),
          )
        ],
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
            itemCount: user.profesiones.length,
            itemBuilder: (_, i) => ListTile(
              title: Text(
                'profesion ${i + 1}: ${user.profesiones[i]}',
              ),
            ),
          )),
        ],
      ),
    );
  }
}
