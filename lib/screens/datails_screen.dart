import 'package:flutter/material.dart';
import 'package:myapp/database/database_helper.dart';

class DetailsScreen extends StatelessWidget {
  final String tarefaTitle;
  final String tarefaDate;
  final String tarefaTime;
  final String tarefaDescription;

  const DetailsScreen({
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
        title: Text(tarefaTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Data: $tarefaDate'),
            Text('Hora: $tarefaTime'),
            Text('Descrição: $tarefaDescription'),
            ElevatedButton(
              onPressed: () async {
                final dbHelper = DatabaseHelper(); // Instancia a classe DatabaseHelper
                await dbHelper.insertTask({
                  'title': tarefaTitle,
                  'date': tarefaDate,
                  'time': tarefaTime,
                  'description': tarefaDescription,
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Tarefa salva com sucesso')),
                );
              },
              child: const Text('Salvar Tarefa'),
            ),
          ],
        ),
      ),
    );
  }
}
