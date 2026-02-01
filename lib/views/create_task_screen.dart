import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/task_viewmodel.dart';
import '../core/widgets/app_background.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  final title = TextEditingController();
  final desc = TextEditingController();
  int priority = 1;

  @override
  Widget build(BuildContext context) {
    final vm = context.read<TaskViewModel>();

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(title: const Text('Criar tarefa')),
      body: AppBackground(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              TextField(controller: title, decoration: const InputDecoration(labelText: 'Título')),
              TextField(controller: desc, decoration: const InputDecoration(labelText: 'Descrição')),
              const SizedBox(height: 16),
              DropdownButton<int>(
                value: priority,
                items: const [
                  DropdownMenuItem(value: 1, child: Text('Baixa')),
                  DropdownMenuItem(value: 2, child: Text('Média')),
                  DropdownMenuItem(value: 3, child: Text('Alta')),
                ],
                onChanged: (v) => setState(() => priority = v!),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () async {
                  await vm.addTask(title.text, desc.text, priority);
                  await vm.loadTasks();
                  Navigator.pop(context);
                },
                child: const Text('Salvar'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
