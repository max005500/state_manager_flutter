// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_manager/models/usuarios.dart';

import 'package:state_manager/services/usuario_service.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    final usuarioService = Provider.of<UsuarioService>(context);
    String? _profesion;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: usuarioService.usuario != null
            ? Text('${usuarioService.usuario?.nombre}')
            : const Text("Pagina 2"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButtom(
                texto: 'Establecer Usuario',
                press: () {
                  usuarioService.usuario = new Usuario(
                      edad: 24,
                      profesiones: [
                        'ingeniero',
                        'abogado',
                        'doctor',
                        'barbero'
                      ],
                      nombre: 'max');
                }),
            CustomButtom(
                texto: 'Cambiar Edad', press: () => usuarioService.edad(37)),
            Form(
                key: myFormKey,
                child: Column(
                  children: [
                    TextFormField(
                        autofocus: true,
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.words,
                        obscureText: false,
                        onSaved: (val) {
                          _profesion = val;
                        },
                        validator: (val) {
                          if (val == null) return 'naa que hacerle siga nomas';
                          return val.length < 3
                              ? 'minimo 3 caracteres mi rey'
                              : null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          hintText: 'ingrese profesion',
                          labelText: 'profesion',
                          helperText: 'debe ingresar una profesion',
                          icon: Icon(Icons.work),
                        )),
                    CustomButtom(
                      texto: 'Anadir Profesion',
                      press: () {
                        if (!myFormKey.currentState!.validate()) {
                          return;
                        }

                        myFormKey.currentState!.save();
                        usuarioService.addProfession(_profesion);
                      },
                    ),
                  ],
                ))
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
      color: Colors.indigo,
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
