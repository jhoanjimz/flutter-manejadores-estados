import 'package:estados/bloc/usuario/usuario_cubit.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Pagina2Page extends StatelessWidget {
  const Pagina2Page({super.key});


  @override
  Widget build(BuildContext context) {
    final usuarioCubit = context.read<UsuarioCubit>();
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
                final newUsuario = Usuario(
                  edad: 26, 
                  nombre: 'Jhoan Jimz', 
                  profesiones: ['FullStack Developer', 'ProPlayer LoL']
                );
                usuarioCubit.seleccionarUsuario(newUsuario);
              },
              color: Colors.blue,
              child: const Text('Establecer Usuario', style: TextStyle(color: Colors.white)),
            ),
            MaterialButton(
              onPressed: () => usuarioCubit.cambiarEdad(32),
              color: Colors.blue,
              child: const Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
            ),
            MaterialButton(
              onPressed: () => usuarioCubit.agregarProfesion(),
              color: Colors.blue,
              child: const Text('Añadir Profesion', style: TextStyle(color: Colors.white)),
            )
          ],
        )
      )
    );
  }
}