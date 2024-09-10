import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  // GlobalKey para o formulário
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 20, 3, 176),
      resizeToAvoidBottomInset: true, // Ajusta o layout para evitar sobreposição pelo teclado
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Espaço superior para afastar a imagem da parte superior da tela
              const SizedBox(height: 100), // Ajuste a altura conforme necessário

              // Imagem acima dos campos
              Image.asset(
                'lib/assets/logo.png',
                height: 200, // Ajuste a altura conforme necessário
                width: 300, // Ajuste a largura conforme necessário
              ),
              const SizedBox(height: 32), // Espaço entre a imagem e os campos

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
                textInputAction: TextInputAction.done,
                controller: _senhaController,
              ),
              const SizedBox(height: 20),

              // Botão de Login
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Aqui você deve validar o usuário, por exemplo, verificar os dados armazenados
                    Navigator.pushReplacementNamed(context, '/tarefas');
                  } else {
                    // Exibir uma mensagem de erro, se necessário
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Preencha todos os campos corretamente')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Cor de fundo do botão
                  foregroundColor: const Color.fromARGB(255, 88, 17, 212), // Cor do texto do botão
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                child: const Text('Login'),
              ),
              const SizedBox(height: 16),

              // Botão de Cadastro
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/cadastro');
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white, // Cor do texto do botão de cadastro
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: const Text(
                  'Cadastre-se',
                  style: TextStyle(
                    color: Colors.white, // Cor do texto
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
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
  }) {
    return TextFormField(
      controller: controller,
      textAlign: TextAlign.center,
      obscureText: obscureText,
      textInputAction: textInputAction,
      style: const TextStyle(color: Colors.white), // Cor do texto digitado
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
    );
  }
}
