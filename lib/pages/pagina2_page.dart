import 'package:estados/models/usuario.dart';
import 'package:estados/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Pagina2Page extends StatelessWidget {
  const Pagina2Page({super.key});


  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);
    return Scaffold(
      appBar: AppBar(
        title: usuarioService.existeUsuario
        ? Text('Usuario: ${usuarioService.usuario.nombre}')
        : const Text('Pagina 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                final newUser = Usuario(
                  edad: 26, 
                  nombre: 'Jhoan Jimenez',
                  profesiones: ['Fullstack Developer', 'Video Jugador Experto']
                );
                usuarioService.usuario = newUser;
              },
              color: Colors.blue,
              child: const Text('Establecer Usuario', style: TextStyle(color: Colors.white)),
            ),
            MaterialButton(
              onPressed: () => usuarioService.cambiarEdad(32),
              color: Colors.blue,
              child: const Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
            ),
            MaterialButton(
              onPressed: () => usuarioService.agregarProfesion(),
              color: Colors.blue,
              child: const Text('Añadir Profesion', style: TextStyle(color: Colors.white)),
            )
          ],
        )
      )
    );
  }
}