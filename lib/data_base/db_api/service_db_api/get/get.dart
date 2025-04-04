import 'dart:convert';
import 'package:http/http.dart' as http;

class GetService {
  final String baseUrl = 'http://localhost:3000/tabelax';

  Future<Map<String, dynamic>> getById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 404) {
      throw Exception('valor não encontrado');
    } else {
      throw Exception('Erro ao carregar valor');
    }
  }
}
