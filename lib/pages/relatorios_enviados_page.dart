import 'package:flutter/material.dart';

class RelatoriosEnviadosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Relatórios Enviados'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Text(
          'Aqui aparecerão os relatórios enviados.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}