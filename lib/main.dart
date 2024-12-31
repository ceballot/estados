import 'package:estados/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/pagina1_page.dart';
import 'pages/pagina2_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UsuarioService()),
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
