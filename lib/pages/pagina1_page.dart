import 'package:estados/models/usuario.dart';
import 'package:estados/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context, listen: true);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pagina 1'),
          actions: [
            IconButton(
                onPressed: () {
                  usuarioService.eliminarUsuario();
                },
                icon: const Icon(Icons.delete))
          ],
        ),
        body: usuarioService.existeUsuario
            ? _InformacionUsuario(usuario: usuarioService.usuario!)
            : const Center(
                child: Text('No existe el usuario'),
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
          usuario.profesiones.isEmpty
              ? const Text('No hay profesiones')
              : Column(
                  children: usuario.profesiones.map((profesion) {
                    return ListTile(
                      title: Text(profesion),
                    );
                  }).toList(),
                ),
        ],
      ),
    );
  }
}
