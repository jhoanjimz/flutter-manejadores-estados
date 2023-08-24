// ignore_for_file: use_key_in_widget_constructors

import 'package:estados/bloc/usuario/usuario_cubit.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
        actions: [
          IconButton(
            onPressed: () => context.read<UsuarioCubit>().borrarUsuario(), 
            icon: const Icon(Icons.exit_to_app)
          )
        ],
      ),
      body: BodyScaffold(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, 'pagina2'),
        child: const Icon(Icons.accessibility_new),
      ),
    );
  }
}

class BodyScaffold extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit, UsuarioState>(
      builder: (_, state) {
        switch(state.runtimeType) {
          case UsuarioInitial:
            return const Center( child: Text('No hay información del usuario'));
          case UsuarioActivo:
            return InformacionUsuario((state as UsuarioActivo).usuario);
          default:
            return const Center( child: Text('Estado no reconocido'));
        }
      }
    );
  }
}

class InformacionUsuario extends StatelessWidget {

  final Usuario usuario;

  const InformacionUsuario(this.usuario, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('General', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
          ListTile(title: Text('Nombre: ${usuario.nombre}')),
          ListTile(title: Text('Edad: ${usuario.edad}')),


          const Text('Profesiones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
          ...usuario.profesiones.map(
            (profesion) => ListTile(title: Text(profesion))
          ).toList()
        ],
      ),
    );
  }
}