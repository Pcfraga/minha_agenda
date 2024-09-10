import 'package:flutter/material.dart';

class EditScreen extends StatelessWidget {
  final String tarefaTitle;
  final String tarefaDate;
  final String tarefaTime;
  final String tarefaDescription;

  const EditScreen({
    super.key,
    required this.tarefaTitle,
    required this.tarefaDate,
    required this.tarefaTime,
    required this.tarefaDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Tarefa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Adicione seus campos de edição aqui
            TextField(
              controller: TextEditingController(text: tarefaTitle),
              decoration: const InputDecoration(labelText: 'Título'),
            ),
            TextField(
              controller: TextEditingController(text: tarefaDate),
              decoration: const InputDecoration(labelText: 'Data'),
            ),
            TextField(
              controller: TextEditingController(text: tarefaTime),
              decoration: const InputDecoration(labelText: 'Hora'),
            ),
            TextField(
              controller: TextEditingController(text: tarefaDescription),
              decoration: const InputDecoration(labelText: 'Descrição'),
            ),
            ElevatedButton(
              onPressed: () {
                // Salve as alterações e navegue de volta, se necessário
                Navigator.pop(context);
              },
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
