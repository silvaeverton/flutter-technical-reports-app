import 'package:flutter/material.dart';
import 'package:report/pages/report_form_page.dart';
import 'pages/home_page.dart';
import 'core/theme/app_colors.dart';

import 'package:flutter/material.dart';
import 'formulario.dart';


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
      home: HomePage(),
    );
  }
}