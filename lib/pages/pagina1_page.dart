import 'package:estados/models/usuario.dart';
import 'package:estados/services/usuario_service.dart';
import 'package:flutter/material.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioManager = UsuarioManager();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pagina 1'),
        ),
        // body: usuarioService.existeUsuario
        body: StreamBuilder(
          stream: usuarioManager.usuarioStream,
          initialData: usuarioManager.getUsuario(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return snapshot.hasData
                ? _InformacionUsuario(
                    usuario: usuarioManager.getUsuario()!,
                  )
                : Center(child: const Text('No hay usuario'));
          },
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.accessibility_new),
            onPressed: () => Navigator.pushNamed(context, 'pagina2')));
  }
}

class _InformacionUsuario extends StatelessWidget {
  const _InformacionUsuario({
    required this.usuario,
  });

  final Usuario usuario;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('General',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
          ListTile(
            title: Text('Nombre: ${usuario.nombre}'),
          ),
          ListTile(
            title: Text('Edad: ${usuario.edad}'),
          ),
          Text('Profesiones',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
          ListTile(
            title: Text('Profesion 1: ${usuario.profesiones[0]}'),
          ),
          ListTile(
            title: usuario.profesiones.length > 1
                ? Text('Profesion 2: ${usuario.profesiones[1]}')
                : Text('Profesion 2: No tiene'),
          ),
          ListTile(
            title: usuario.profesiones.length > 2
                ? Text('Profesion 3: ${usuario.profesiones[2]}')
                : Text('Profesion 3: No tiene'),
          ),
        ],
      ),
    );
  }
}
