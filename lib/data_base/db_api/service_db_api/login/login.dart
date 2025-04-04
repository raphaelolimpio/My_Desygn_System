import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class DeleteService {
  final String baseUrl = 'http://localhost:3000/tabelax';

  Future<void> login(Map<String, dynamic> credentials) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(credentials),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      String token = data['token'];
      final storage = FlutterSecureStorage();
      await storage.write(key: 'token', value: token);
      print("Token armazenado com sucesso.");
    } else {
      throw Exception('Erro ao fazer login');
    }
  }
}
