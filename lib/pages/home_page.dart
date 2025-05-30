import 'package:flutter/material.dart';
import 'package:report/pages/report_form_page.dart';
import 'pages/report_form_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Imagem de fundo
          Image.asset(
            'assets/imagem_fundo_home.jpg',
            fit: BoxFit.cover,
          ),
          // Conteúdo sobre a imagem
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black.withOpacity(0.7), // Botão com fundo escuro translúcido
                foregroundColor: Colors.greenAccent, // Texto verde
              ),
              child: const Text("Novo Relatório"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => FormularioPage()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
