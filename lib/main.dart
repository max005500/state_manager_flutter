import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:state_manager/pages/pages.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'pagina1',
      getPages: [
        GetPage(
          name: '/pagina1',
          page: () => const Pagina1Page(),
        ),
        GetPage(
          name: '/pagina2',
          page: () => const Pagina2Page(),
        ),
      ],
      // routes: {
      //   'pagina1': (_) => const Pagina1Page(),
      //   'pagina2': (_) => const Pagina2Page(),
      // },
    );
  }
}
