import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_manager/bloc/user/user_bloc.dart';
import 'package:state_manager/models/usuarios.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pagina 1"),
        backgroundColor: Colors.pink,
        actions: [
          IconButton(
              onPressed: () => BlocProvider.of<UserBloc>(context, listen: false)
                  .add(DeleteUser()),
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (_, state) {
          return state.existUser
              ? InformacionUsuario(user: state.user!)
              : const BadState();
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        child: const Icon(Icons.accessibility_new),
        onPressed: () => Navigator.pushNamed(context, 'pagina2'),
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final User user;

  const InformacionUsuario({
    super.key,
    required this.user,
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
              itemBuilder: (_, index) => ListTile(
                title: Text(
                  "profesion ${index + 1}: ${user.profesiones[index]}",
                ),
              ),
              itemCount: user.profesiones.length,
            ),
          ),
        ],
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
