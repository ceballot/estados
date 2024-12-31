import 'dart:async';

import 'package:estados/models/usuario.dart';

class UsuarioManager {
  // Instancia única del Singleton
  static final UsuarioManager _instance = UsuarioManager._internal();

  // Constructor privado
  UsuarioManager._internal();

  // Método factory para devolver la misma instancia
  factory UsuarioManager() {
    return _instance;
  }

// Instancia de Usuario gestionada por el Singleton
  Usuario? _usuario;

  // StreamController para emitir actualizaciones
  final StreamController<Usuario?> _usuarioController =
      StreamController<Usuario?>.broadcast();

  // Getter para el Stream
  Stream<Usuario?> get usuarioStream => _usuarioController.stream;

// Método para establecer un Usuario
  void setUsuario(Usuario usuario) {
    _usuario = usuario;
    _usuarioController.sink.add(_usuario); // Emitir la actualización
  }

  // Método para obtener el Usuario actual
  Usuario? getUsuario() {
    return _usuario;
  }

  // Método para verificar si hay un Usuario configurado
  bool hasUsuario() {
    return _usuario != null;
  }

// Método para cambiar la edad del Usuario
  void changeEdad(int nuevaEdad) {
    if (_usuario != null) {
      _usuario = Usuario(
        nombre: _usuario!.nombre,
        edad: nuevaEdad,
        profesiones: _usuario!.profesiones,
      );
      _usuarioController.sink.add(_usuario); // Emitir la actualización
    } else {
      throw Exception('No hay un Usuario configurado.');
    }
  }

// Método para agregar una profesión al Usuario actual
  void addProfesion(String profesion) {
    if (_usuario != null) {
      _usuario = Usuario(
        nombre: _usuario!.nombre,
        edad: _usuario!.edad,
        profesiones: List.from(_usuario!.profesiones)..add(profesion),
      );
      _usuarioController.sink.add(_usuario); // Emitir la actualización
    } else {
      throw Exception('No hay un Usuario configurado.');
    }
  }

  // Cerrar el StreamController
  void dispose() {
    _usuarioController.close();
  }
}
