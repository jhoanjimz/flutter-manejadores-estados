
import 'package:bloc/bloc.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';

part 'user_event.dart';
part 'user_state.dart';


class UserBloc extends Bloc<UserEvent, UserState> {

  UserBloc() : super(const UserInitialState()) {
    on<ActivateUser>((event, emit) => emit(UserSetState(event.user)));
    on<DeleteUsuario>((event, emit) => emit( const UserInitialState()));
    on<ChangeUserAge>((event, emit) {
      if(!state.existUser) return;
      emit(UserSetState(state.user!.copyWith(edad: event.edad)));
    });
    on<AddProfesion>((event, emit){
      if(!state.existUser) return;
      final List<String> profesiones = [...state.user!.profesiones, event.profesion];
      emit(UserSetState(state.user!.copyWith( profesiones: profesiones)));
    });
  }

}