import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/usuario.dart';

class UsuariosPage extends StatelessWidget {

  final ApiService apiService = ApiService();

  UsuariosPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Usuarios"),
      ),

      body: FutureBuilder<List<Usuario>>(
        future: apiService.obtenerUsuarios(),

        builder: (context, snapshot) {
//snapshot es un objeto que contiene: datos recibidos
//error si ocurrió
//estado de carga
//Significa que la API ya respondió.
          if (snapshot.hasData) { //ya se verifico que hay datos
            List<Usuario> usuarios = snapshot.data!;//este valor no es null

//no crea todos los elementos al mismo tiempo, los crea solo cuando se necesitan al hacer scroll
            return ListView.builder( //sirve para crear listas dinámicas en Flutter.
              itemCount: usuarios.length,
              itemBuilder: (context, index) {

                final usuario = usuarios[index];

                return Card(
                  margin: const EdgeInsets.all(10),

                  child: ListTile(
                    title: Text(usuario.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(usuario.email),
                        Text(usuario.phone),
                        Text(usuario.website),
                      ],
                    ),
                  ),

                );

              },
            );

          }

          if (snapshot.hasError) {
            return const Center(
              child: Text("Error al cargar datos"),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );

        },

      ),

    );

  }

}