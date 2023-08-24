import 'package:estados/controllers/usuario_controller.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({super.key});

  @override
  Widget build(BuildContext context) {

    final usuarioCtrl = Get.find<UsuarioController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                usuarioCtrl.cargarUsuario(Usuario( nombre: 'Jhoan Jimz', edad: 26, profesiones: [] ));
                Get.snackbar(
                  'Usuario establecido', 
                  'Jhoan es el usuario autorizado',
                  backgroundColor: Colors.white,
                  boxShadows: [
                    const BoxShadow( 
                      color: Colors.black38,
                      blurRadius: 10
                    )
                  ]
                );
              },
              color: Colors.blue,
              child: const Text('Establecer Usuario', style: TextStyle(color: Colors.white)),
            ),
            MaterialButton(
              onPressed: () => usuarioCtrl.cambiarEdad(32),
              color: Colors.blue,
              child: const Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
            ),
            MaterialButton(
              onPressed: () => usuarioCtrl.agregarProfesiones('Profesion ${usuarioCtrl.profesionesCount + 1}'),
              color: Colors.blue,
              child: const Text('Añadir Profesion', style: TextStyle(color: Colors.white)),
            ),
            MaterialButton(
              onPressed: () => Get.changeTheme(
                Get.isDarkMode 
                ? ThemeData.light()
                : ThemeData.dark()
              ),
              color: Colors.blue,
              child: const Text('Cambiar tema', style: TextStyle(color: Colors.white)),
            )
          ],
        )
      )
    );
  }
}