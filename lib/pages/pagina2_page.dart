import 'package:estados/bloc/user/user_bloc.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Pagina2Page extends StatelessWidget {
  const Pagina2Page({super.key});


  @override
  Widget build(BuildContext context) {

    final userBloc = BlocProvider.of<UserBloc>(context);

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
                final newUser = Usuario(
                  edad: 26, 
                  nombre: 'Jhoan Jimz', 
                  profesiones: ['FullStack Developer', 'ProPlayer LoL']
                );
                userBloc.add(ActivateUser(newUser));
              },
              color: Colors.blue,
              child: const Text('Establecer Usuario', style: TextStyle(color: Colors.white)),
            ),
            MaterialButton(
              onPressed: () => userBloc.add(ChangeUserAge(32)),
              color: Colors.blue,
              child: const Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
            ),
            MaterialButton(
              onPressed: () => userBloc.add(AddProfesion('Profesion ${userBloc.state.user!.profesiones.length + 1}')),
              color: Colors.blue,
              child: const Text('Añadir Profesion', style: TextStyle(color: Colors.white)),
            )
          ],
        )
      )
    );
  }
}