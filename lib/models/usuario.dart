

// ignore_for_file: unnecessary_null_comparison

class Usuario {

  String nombre;
  int? edad;
  List<String>? profesiones;

  Usuario({ required this.nombre, this.edad, this.profesiones })
  :assert(nombre != null);

}