import 'package:flutter/material.dart';
import 'package:report/pages/report_form_page.dart';


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
          // Camada de escurecimento opcional
          Container(color: Colors.black.withOpacity(0.5)),

          // Conteúdo central com os botões
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black.withOpacity(0.7),
                    foregroundColor: Colors.greenAccent,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: const Text("Novo Relatório"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => FormularioPage()),
                    );
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black.withOpacity(0.7),
                    foregroundColor: Colors.greenAccent,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: const Text("Ver Relatórios Enviados"),
                  onPressed: () {
                    Navigator.pushNamed(context, '/relatorios');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}