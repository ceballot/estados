import 'package:flutter/material.dart';
import 'package:estados/models/usuario.dart';

class UsuarioService extends ChangeNotifier {
  Usuario? _usuario;

  Usuario? get usuario => _usuario;

  set usuario(Usuario? usuario) {
    _usuario = usuario;
    notifyListeners();
  }

  bool get existeUsuario => _usuario != null;

  void cambiarEdad(int edad) {
    if (_usuario != null) {
      _usuario!.edad = edad;
      notifyListeners();
    }
  }

  void eliminarUsuario() {
    _usuario = null;
    notifyListeners();
  }

  void agregarProfesion(String profesion) {
    if (_usuario != null) {
      _usuario!.profesiones.add(profesion);
      notifyListeners();
    }
  }
}
