part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class ActivateUser extends UserEvent {
  final Usuario user;
  ActivateUser(this.user);
}
class ChangeUserAge extends UserEvent {
  final int edad;
  ChangeUserAge(this.edad);
}
class AddProfesion extends UserEvent {
  final String profesion;
  AddProfesion(this.profesion);
}
class DeleteUsuario extends UserEvent {}