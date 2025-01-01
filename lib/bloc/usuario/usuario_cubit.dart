import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'usuario_state.dart';

class UsuarioCubit extends Cubit<UsuarioState> {
  UsuarioCubit() : super((UsuarioInitial()));

  void seleccionarUsuario(Usuario usuario) {
    emit(UsuarioActivo(usuario));
  }

  void cambiarEdad(int edad) {
    final currentState = state;
    if (currentState is UsuarioActivo) {
      final newUser = currentState.usuario.copyWith(edad: edad);
      emit(UsuarioActivo(newUser));
    }
  }

  void agregarProfesion(String profesion) {
    final currentState = state;
    if (currentState is UsuarioActivo) {
      final newUser = currentState.usuario.copyWith(
        profesiones: [...currentState.usuario.profesiones, profesion],
      );
      emit(UsuarioActivo(newUser));
    }
  }

  void eliminarUsuario() {
    emit(UsuarioInitial());
  }
}
