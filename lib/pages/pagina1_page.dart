import 'package:estados/bloc/user/user_bloc.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                  BlocProvider.of<UserBloc>(context).add(DeleteUserEvent());
                },
                icon: const Icon(Icons.delete))
          ],
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            return state.existUser
                ? InformacionUsuario(user: state.user!)
                : const Center(
                    child: Text('No hay usuario seleccionado'),
                  );
          },
        ),
        // InformacionUsuario()
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.accessibility_new),
            onPressed: () => Navigator.pushNamed(context, 'pagina2')));
  }
}

class InformacionUsuario extends StatelessWidget {
  final User user;
  const InformacionUsuario({
    super.key,
    required this.user,
  });

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
            title: Text('Nombre: ${user.nombre}'),
          ),
          ListTile(
            title: Text('Edad:  ${user.edad}'),
          ),
          Text('Profesiones',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
          for (var i = 0; i < user.profesiones.length; i++)
            ListTile(
              title: Text('Profesion ${i + 1}: ${user.profesiones[i]}'),
            ),
        ],
      ),
    );
  }
}
