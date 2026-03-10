import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/usuario.dart';

class ApiService {

  Future<List<Usuario>> obtenerUsuarios() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users')
    );

    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);

      return jsonResponse.map((usuario) => Usuario.fromJson(usuario))
      .toList();
    } else {
      throw Exception('Error al cargar los usuarios');
    }
  }
}