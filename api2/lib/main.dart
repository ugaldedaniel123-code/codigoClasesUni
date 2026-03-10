import 'package:flutter/material.dart';
import 'pages/usuarios_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Consumo de API',
      debugShowCheckedModeBanner: false,
      home: UsuariosPage(),
    );

  }

}