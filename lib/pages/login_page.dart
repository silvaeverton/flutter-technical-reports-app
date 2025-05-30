import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usuarioController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  void _login() {
    final usuario = _usuarioController.text.trim();
    final senha = _senhaController.text.trim();

    if (_formKey.currentState!.validate()) {
      if (usuario == 'tecnico' && senha == '1234') {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Usuário ou senha inválidos')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Fundo preto
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 32.0, vertical: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ANIMAÇÃO DA LOGO
                  TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0.8, end: 1.0),
                    duration: Duration(seconds: 2),
                    curve: Curves.easeInOut,
                    builder: (context, value, child) {
                      return Transform.scale(
                        scale: value,
                        child: Opacity(
                          opacity: value,
                          child: Image.asset(
                            'assets/irricontrol_neon.png',
                            height: 270,
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 24),
                  // TÍTULO
                  Text(
                    'Login do Técnico',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.greenAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 32),
                  // FORMULÁRIO
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          width: 260,
                          child: TextFormField(
                            controller: _usuarioController,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: 'Usuário',
                              labelStyle: TextStyle(color: Colors.greenAccent),
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 12),
                            ),
                            validator: (value) => value!.isEmpty
                                ? 'Informe o nome de usuário'
                                : null,
                          ),
                        ),
                        SizedBox(height: 16),
                        SizedBox(
                          width: 260,
                          child: TextFormField(
                            controller: _senhaController,
                            obscureText: true,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: 'Senha',
                              labelStyle: TextStyle(color: Colors.greenAccent),
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 12),
                            ),
                            validator: (value) =>
                            value!.isEmpty ? 'Informe a senha' : null,
                          ),
                        ),
                        SizedBox(height: 24),
                        SizedBox(
                          width: 140,
                          child: ElevatedButton(
                            onPressed: _login,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                            ),
                            child: Text('Entrar'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}