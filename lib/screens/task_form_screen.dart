import 'package:flutter/material.dart';

class TaskFormScreen extends StatefulWidget {
  final String? initialTitle;
  final String? initialDate;
  final String? initialTime;
  final String? initialDescription; // Novo campo para descrição

  const TaskFormScreen({
    super.key,
    this.initialTitle,
    this.initialDate,
    this.initialTime,
    this.initialDescription, // Adiciona o campo ao construtor
  });

  @override
  _TaskFormScreenState createState() => _TaskFormScreenState();
}

class _TaskFormScreenState extends State<TaskFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _title;
  late String _date;
  late String _time;
  late String _description; // Novo campo para descrição

  @override
  void initState() {
    super.initState();
    _title = widget.initialTitle ?? '';
    _date = widget.initialDate ?? '';
    _time = widget.initialTime ?? '';
    _description = widget.initialDescription ?? ''; // Inicializa o campo de descrição
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de Tarefa'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveTask,
          ),
        ],
        automaticallyImplyLeading: false, // Remove o botão de menu sanduíche
      ),
      backgroundColor: const Color.fromARGB(255, 21, 11, 113),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  initialValue: _title,
                  decoration: const InputDecoration(
                    labelText: 'Título',
                    border: UnderlineInputBorder(),
                  ),
                  onSaved: (value) => _title = value ?? '',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira um título';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  initialValue: _date,
                  decoration: const InputDecoration(
                    labelText: 'Data (YYYY-MM-DD)',
                    border: UnderlineInputBorder(),
                  ),
                  onSaved: (value) => _date = value ?? '',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira uma data';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  initialValue: _time,
                  decoration: const InputDecoration(
                    labelText: 'Hora (HH:MM)',
                    border: UnderlineInputBorder(),
                  ),
                  onSaved: (value) => _time = value ?? '',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira uma hora';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  initialValue: _description,
                  decoration: const InputDecoration(
                    labelText: 'Descrição',
                    border: UnderlineInputBorder(),
                  ),
                  onSaved: (value) => _description = value ?? '',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira uma descrição';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20.0),
                Center(
                  child: ElevatedButton(
                    onPressed: _saveTask,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color.fromARGB(255, 88, 17, 212),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                    child: const Text('Salvar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _saveTask() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      Navigator.pop(context, {
        'title': _title,
        'date': _date,
        'time': _time,
        'description': _description, // Passa a descrição para a tela anterior
      });
    }
  }
}
