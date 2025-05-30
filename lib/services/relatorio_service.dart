import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/relatorio.dart'; // import do modelo

class RelatorioService {
  static Future<void> enviarRelatorio(Relatorio relatorio) async {
    final url = Uri.parse('http://10.0.2.2:8080/api/relatorios'); // ou o IP da sua máquina

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(relatorio.toJson()),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      print('Relatório enviado com sucesso!');
    } else {
      print('Erro ao enviar relatório: ${response.statusCode}');
      throw Exception('Falha ao enviar relatório');
    }
  }
}