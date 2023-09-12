import 'package:flutter/material.dart';

class CadastroPage extends StatelessWidget {
  const CadastroPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
      ),
      body: const Center(
        child: CadastroForm(),
      ),
    );
  }
}

class CadastroForm extends StatefulWidget {
  const CadastroForm({Key? key});

  @override
  // ignore: library_private_types_in_public_api
  _CadastroFormState createState() => _CadastroFormState();
}

class _CadastroFormState extends State<CadastroForm> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: _nomeController,
            decoration: const InputDecoration(
              labelText: 'Nome',
              hintText: 'Informe seu nome',
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Color.fromARGB(255, 30, 28, 28),
            ),
          ),
          const SizedBox(height: 16.0),
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
            controller: _senhaController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Senha',
              hintText: 'Informe sua senha',
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Color.fromARGB(255, 30, 28, 28),
            ),
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: _senhaController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Confirme sua senha',
              hintText: 'Digite as credenciais identicas',
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Color.fromARGB(255, 30, 28, 28),
            ),
          ),
          const SizedBox(height: 8.0), // Espaço entre os botões
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                final nome = _nomeController.text;
                final email = _emailController.text;
                final senha = _senhaController.text;
                print('Nome: $nome');
                print('E-mail: $email');
                print('Senha: $senha');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // Cor do botão
                padding: const EdgeInsets.symmetric(
                    vertical: 16), // Aumente o tamanho vertical
              ),
              child: const Text(
                'Cadastrar',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
