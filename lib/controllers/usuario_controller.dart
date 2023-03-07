import 'package:get/get.dart';
import 'package:state_manager/models/usuarios.dart';

class UsuarioController extends GetxController {
  RxBool existeUsuario = false.obs;
  Rx<Usuarios> user = new Usuarios(edad: 0, professiones: [''], nombre: '').obs;

  void cargarUsuario(Usuarios user) {
    this.existeUsuario.value = true;
    this.user.value = user;
  }

  void cambiarEdad(int age) {
    this.user.update((val) => val!.edad = age);
  }

  void agregarProfesion(String profession) {
    this.user.update((val) => val!.professiones.add(profession));
  }
}
