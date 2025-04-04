import 'package:http/http.dart' as http;

class DeleteService {
  final String baseUrl = 'http://localhost:3000/tabelax';

  Future<void> delete(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));
    if (response.statusCode == 204) {
      print("Valor excluído com sucesso.");
    } else {
      throw Exception('Erro ao excluir valor');
    }
  }
}
