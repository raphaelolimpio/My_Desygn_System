import 'dart:convert';
import 'package:http/http.dart' as http;

class GetAllService {
  final String baseUrl = 'http://localhost:3000/tabelax';

  Future<List> getAll() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Erro ao carregar resultados');
    }
  }
}
