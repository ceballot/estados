import 'package:estados/bloc/usuario/usuario_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'pages/pagina1_page.dart';
import 'pages/pagina2_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => UsuarioCubit()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Estados',
          initialRoute: 'pagina1',
          routes: {
            'pagina1': (_) => Pagina1Page(),
            'pagina2': (_) => Pagina2Page(),
          }),
    );
  }
}
