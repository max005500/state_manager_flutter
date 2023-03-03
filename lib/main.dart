import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_manager/pages/pages.dart';
import 'package:state_manager/services/usuario_service.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => new UsuarioService())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'pagina1',
        routes: {
          'pagina1': (_) => const Pagina1Page(),
          'pagina2': (_) => const Pagina2Page(),
        },
      ),
    );
  }
}
