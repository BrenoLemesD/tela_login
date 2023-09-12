import 'package:flutter/material.dart';
import 'telaCadastro.dart'; // Importe o arquivo telaCadastro.dart

void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.blueGrey[900],
        scaffoldBackgroundColor: Colors.blueGrey[800],
      ),
      home: const LoginPage(),
      routes: {
        '/cadastro': (context) =>
            const CadastroPage(), // Rota para tela de cadastro
      },
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: const Center(
        child: LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isObscure = true; // Variável para controlar a visibilidade da senha

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: 'E-mail',
              hintText: 'Informe seu e-mail',
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Color.fromARGB(255, 30, 28, 28),
            ),
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: _passwordController,
            obscureText:
                _isObscure, // Usa a variável para controlar a visibilidade
            decoration: InputDecoration(
              labelText: 'Senha',
              hintText: 'Informe sua senha',
              border: const OutlineInputBorder(),
              filled: true,
              fillColor: const Color.fromARGB(255, 29, 26, 26),
              suffixIcon: IconButton(
                icon: Icon(_isObscure
                    ? Icons.visibility_off
                    : Icons.visibility), // Ícone de visibilidade
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure; // Alterna a visibilidade da senha
                  });
                },
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                final email = _emailController.text;
                final password = _passwordController.text;
                print('E-mail digitado: $email');
                print('Senha digitada: $password');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(
                    vertical: 16), // Aumente o tamanho vertical
              ),
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          const SizedBox(height: 8.0), // Espaço entre os botões
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Navegar para a tela de cadastro
                Navigator.pushNamed(context, '/cadastro');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // Cor do botão
                padding: const EdgeInsets.symmetric(
                    vertical: 16), // Aumente o tamanho vertical
              ),
              child: const Text(
                'Cadastro',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
