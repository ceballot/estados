import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:estados/bloc/usuario/usuario_cubit.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pagina 1'),
          actions: [
            IconButton(
                onPressed: () {
                  BlocProvider.of<UsuarioCubit>(context).eliminarUsuario();
                },
                icon: const Icon(Icons.exit_to_app))
          ],
        ),
        body: BlocBuilder<UsuarioCubit, UsuarioState>(
          builder: (_, state) {
            if (state is UsuarioActivo) {
              return _InformacionUsuario(state.usuario);
            } else {
              return const Center(
                child: Text('No existe usuario'),
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.accessibility_new),
            onPressed: () => Navigator.pushNamed(context, 'pagina2')));
  }
}

class _InformacionUsuario extends StatelessWidget {
  const _InformacionUsuario(
    this.usuario,
  );

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
            title: Text('Nombre: ${usuario.nombre} '),
          ),
          ListTile(
            title: Text('Edad: ${usuario.edad} '),
          ),
          Text('Profesiones',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
          for (var i = 0; i < usuario.profesiones.length; i++)
            ListTile(
              title: Text('Profesion ${i + 1}: ${usuario.profesiones[i]} '),
            ),
        ],
      ),
    );
  }
}
