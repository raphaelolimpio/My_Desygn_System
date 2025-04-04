import 'dart:convert';
import 'package:http/http.dart' as http;

class CreateService {
  final String baseUrl = 'http://localhost:3000/tabelax';

  Future<void> create(Map<String, dynamic> tabelax) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(tabelax),
    );
    if (response.statusCode == 201) {
      print("Cliente criado com sucesso.");
    } else {
      throw Exception('Erro ao criar cliente');
    }
  }
}
