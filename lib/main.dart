import 'package:flutter/material.dart';
import 'package:report/pages/home_page.dart';
import 'package:report/pages/relatorios_enviados_page.dart';
import 'package:report/pages/report_form_page.dart';
import 'package:report/pages/login_page.dart'; // Adicione este arquivo na pasta pages
import 'core/theme/app_colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeData theme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.green,
    scaffoldBackgroundColor: Colors.black,
    colorScheme: ColorScheme.dark(
      primary: Colors.green,
      secondary: Colors.greenAccent,
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: Colors.greenAccent),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.greenAccent),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.green),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Formulário de Atendimento',
      theme: theme,
      initialRoute: '/', // Início pelo login
      routes: {
        '/': (context) => LoginPage(),      // Tela de login
        '/home': (context) => HomePage(),   // Tela após login
        '/relatorios': (context) => RelatoriosEnviadosPage(),
      },
    );
  }
}