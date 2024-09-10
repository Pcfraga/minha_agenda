import 'package:flutter/material.dart';

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});

  @override
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _repitaSenhaController = TextEditingController();
  
  // Lista para armazenar usuários (apenas para teste, substitua por uma solução real)
  final List<Map<String, String>> _usuarios = [];

  void _cadastrar() {
    if (_formKey.currentState?.validate() ?? false) {
      // Simula o armazenamento do usuário
      _usuarios.add({
        'nome': _nomeController.text,
        'email': _emailController.text,
        'senha': _senhaController.text,
      });

      // Navega de volta para a tela de login
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cadastro',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 52, 20, 235),
        centerTitle: true,
        leading: const SizedBox.shrink(),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: const Color.fromARGB(255, 15, 23, 184),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Imagem acima dos campos
                Image.asset(
                  'lib/assets/logo.png',
                  height: 200,
                  width: 300,
                ),
                const SizedBox(height: 32),

                // Campo de Nome
                _buildTextField(
                  label: 'Nome',
                  obscureText: false,
                  textInputAction: TextInputAction.next,
                  controller: _nomeController,
                ),
                const SizedBox(height: 16),

                // Campo de Email
                _buildTextField(
                  label: 'Email',
                  obscureText: false,
                  textInputAction: TextInputAction.next,
                  controller: _emailController,
                ),
                const SizedBox(height: 16),

                // Campo de Senha
                _buildTextField(
                  label: 'Senha',
                  obscureText: true,
                  textInputAction: TextInputAction.next,
                  controller: _senhaController,
                ),
                const SizedBox(height: 16),

                // Campo de Repita a Senha
                _buildTextField(
                  label: 'Repita a Senha',
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  controller: _repitaSenhaController,
                  validator: (value) {
                    if (value != _senhaController.text) {
                      return 'As senhas não coincidem';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Botão de Cadastro
                ElevatedButton(
                  onPressed: _cadastrar,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Cor de fundo
                    foregroundColor: const Color.fromARGB(255, 88, 17, 212), // Cor do texto
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: const Text('Cadastrar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required bool obscureText,
    required TextInputAction textInputAction,
    required TextEditingController controller,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      textAlign: TextAlign.center,
      obscureText: obscureText,
      textInputAction: textInputAction,
      style: const TextStyle(color: Colors.white), // Define a cor do texto digitado
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        contentPadding: const EdgeInsets.only(bottom: 10),
        labelText: label,
        labelStyle: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      validator: validator,
    );
  }
}
