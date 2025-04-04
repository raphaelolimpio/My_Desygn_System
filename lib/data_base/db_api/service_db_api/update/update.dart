import 'dart:convert';
import 'package:http/http.dart' as http;

class UpdateService {
  final String baseUrl = 'http://localhost:3000/tabelax';

  Future<void> update(int id, Map<String, dynamic> tabelax) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(tabelax),
    );
    if (response.statusCode == 200) {
      print("valor atualizado com sucesso.");
    } else {
      throw Exception('Erro ao atualizar valor');
    }
  }
}
