import 'package:estados/models/usuario.dart';
import 'package:estados/services/usuario_service.dart';
import 'package:flutter/material.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioManager = UsuarioManager();
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: usuarioManager.usuarioStream,
          initialData: usuarioManager.getUsuario(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return snapshot.hasData
                ? Text(snapshot.data.nombre)
                : const Text('Pagina 2');
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                final nuevoUsuario = Usuario(
                    nombre: 'Fernando Herrera',
                    edad: 35,
                    profesiones: ['Profesor']);
                usuarioManager.setUsuario(nuevoUsuario);
              },
              color: Colors.blue,
              child: const Text(
                'Establecer usuario',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              onPressed: () {
                if (usuarioManager.hasUsuario()) {
                  usuarioManager.changeEdad(50);
                }
              },
              color: Colors.blue,
              child: const Text(
                'Cambiar Edad',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              onPressed: () {
                if (usuarioManager.hasUsuario()) {
                  usuarioManager.addProfesion('Profesor de Flutter');
                }
              },
              color: Colors.blue,
              child: const Text(
                'Añadir Profesión',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
