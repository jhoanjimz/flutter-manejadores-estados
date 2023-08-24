import 'package:get/get.dart';
import 'package:estados/models/usuario.dart';

class UsuarioController extends GetxController {
  var existeUsuario = false.obs;
  var usuario = Usuario().obs;

  get profesionesCount {
    return usuario.value.profesiones!.length;
  }

  void cargarUsuario( Usuario pUsuario ) {
    existeUsuario.value = true;
    usuario.value = pUsuario;
  }

  void cambiarEdad( int edad ) {
    usuario.update((val) {
      val!.edad = edad;
    });
  }

  void agregarProfesiones( String profesion ) {
    usuario.update((val) {
      val!.profesiones = [...val.profesiones!, profesion];
    });
  }

}